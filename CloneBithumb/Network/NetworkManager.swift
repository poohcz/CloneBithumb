//
//  NetworkService.swift
//  CloneBithumb
//
//  Created by 김동율 on 10/3/24.
//

import RxSwift
import RxCocoa
import UIKit

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    func requestInGet<T: Codable>(url: String, params: [String: String]) -> Observable<T> {

        return Observable.create { observer in
            // Query 파라미터 넣기 위해 Get방식할때 많이 사용한다. 컴포넌트
            var urlComponents = URLComponents(string: url)!
            urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
                // 예시
//            let keyword = URLQueryItem(name: "keyword", value: "iOS")
//            let page = URLQueryItem(name: "page", value: "1")
//            urlComponents.queryItems = [keyword, page]
            
            var request = URLRequest(url: urlComponents.url!)
            request.httpMethod = "GET"
            print("김동률3")
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                // 네트워크 오류일때
                if let error = error {
                    observer.onError(error)
                    print("김동률3-1:", error)
                    return
                }
                
                // 빈값일때
                guard let data = data else {
                    print("김동률3-2:")
                    observer.onError(NSError(domain: "EmptyData", code: 0000, userInfo: nil))
                    return
                }
                
                do {
                    print("김동률4")
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(decodedData)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}


