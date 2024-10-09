//
//  OneViewModel.swift
//  CloneBithumb
//
//  Created by 김동율 on 9/28/24.
//

import UIKit
import RxSwift
import RxCocoa

class ExchangeViewModel {
    
    let exchangeData: PublishSubject<[ExchangeModel]> = PublishSubject()
    let disposeBag: DisposeBag = DisposeBag()
    
    func getExchangeData() {
        let url = "https://api.bithumb.com/v1/market/all"
        let params: [String: String] = [:]
        
        NetworkManager.shared.requestExchangeInGet(url: url, params: params)
            .subscribe(onNext: { [weak self] (data: [ExchangeModel]) in
                guard let self = self else { return }
                self.exchangeData.onNext(data)
            }, onError: { error in
                print("getExchangeDataError::", error)
            })
        
            .disposed(by: disposeBag)
            /*
             .disposed(by: disposeBag) <-- 일반적인 구독해제 방식(자동)
             .dispose() <-- 즉시해제한다. 그래서 ExchangeVC에 Data가 전달이 되지 않았다.(수동)
             */
    }
    
    func getCandle() {
        // 1. 모델에 market값만 파라미터로 사용할거니간 추출. 2. 파라미터로 만들어서 네트워크 호출. 이렇게 해보자
        // take(1) <-- 배열을 한번만 가져온다는 뜻. idx 첫번째 것만 가져온다는 것이 아님. 헷갈림.
        let url = "https://api.bithumb.com/v1/candles/minutes/1"
        exchangeData
            .take(1)
        // exchangeData data 추출.
            .map { data in
                // 추출한 data에서 market만 가져오기
                data.map {
                    $0.market
                }
            }
            .subscribe(onNext: { [weak self] (marketArr: [String]) in
                guard let self else { return }

//                for market in marketArr {
//                    // 각 market에 대한 params 딕셔너리 생성
//                    let params: [String: Any] = [
//                        "to": "200",
//                        "market": market
//                    ]
//                    // 하아... 이렇게 하나씩 api호출하는게 맞는건지 모르겟다...
//                    NetworkManager.shared.requestCandleInGet(url: url, params: ["market" : "KRW-BTC", "count" : "200"])
//                        .subscribe(onNext: { (candleData: [CandleModel]) in
//                            // 성공적으로 데이터를 수신했을 때 처리
//                            print("Candle Data for \(market):", candleData)
//                        }, onError: { error in
//                            // 에러 처리
//                            print("Error fetching candle data for \(market):", error)
//                        })
//                        .disposed(by: self.disposeBag) // disposeB
//                                   
//                }
                NetworkManager.shared.requestCandleInGet(url: url, params: ["market" : "KRW-BTC", "count" : "1"])
                    .subscribe(onNext: { (candleData: [CandleModel]) in
                        // 성공적으로 데이터를 수신했을 때 처리
                        print("김동률성공")
                    }, onError: { error in
                        // 에러 처리
                        print("김동률실패")
                    })
                    .disposed(by: self.disposeBag) // disposeB
            })
            .disposed(by: disposeBag)
    }
}
