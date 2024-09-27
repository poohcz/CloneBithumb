//
//  LaunchVC.swift
//  CloneBithumb
//
//  Created by 김동율 on 9/27/24.
//

import Foundation
import UIKit

protocol ViewModel: AnyObject {
    /// 입출력을 담당함. associatedtype은 placeholder같음.
    associatedtype Input
    associatedtype Output
    
    /// 입력 -> 출력
    func transform(input: Input) -> Output
}

class LaunchVC: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 첫화면 시작 이후 2초이후 이동.(추후 로티아무거나 만들어서 할 것). 가장베스트는 비동기로 로티영상 끝나고. 고려할 것.
        view.backgroundColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let baseTabbar = BaseTabbarVC()
            baseTabbar.modalPresentationStyle = .fullScreen
            self.present(baseTabbar, animated: true, completion: nil)
        }
    }

}
