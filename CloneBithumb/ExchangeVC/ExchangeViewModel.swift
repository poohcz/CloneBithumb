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
        
        NetworkManager.shared.requestInGet(url: url, params: params)
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
}
