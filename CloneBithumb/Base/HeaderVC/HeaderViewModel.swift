//
//  HeaderViewModel.swift
//  CloneBithumb
//
//  Created by 김동율 on 9/28/24.
//

import RxSwift
import RxCocoa

class HeaderViewModel: ViewModel {
    
    /// 헤더뷰에서 들어오는건 각 버튼 5개 눌렀을 경우
    struct Input {
        let firstBtnTapped: Observable<Void>
        let secondBtnTapped: Observable<Void>
        let thirdBtnTapped: Observable<Void>
        let fourthBtnTapped: Observable<Void>
        let fifthBtnTapped: Observable<Void>
    }
    
    /// 헤더뷰에서 나가는건 각 버튼을 누른 후 페이지 이동
    struct Output {
        let moveToOneVC: Observable<Void>
        let moveToTwoVC: Observable<Void>
        let moveToThreeVC: Observable<Void>
        let moveToFourVC: Observable<Void>
        let moveToFiveVC: Observable<Void>
    }
    
    
    func transform(input: Input) -> Output {
        return Output(moveToOneVC: input.firstBtnTapped, moveToTwoVC: input.secondBtnTapped, moveToThreeVC: input.thirdBtnTapped, moveToFourVC: input.fourthBtnTapped, moveToFiveVC: input.fifthBtnTapped)
    }
}

