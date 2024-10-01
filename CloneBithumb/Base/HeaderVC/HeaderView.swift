//
//  HeaderView.swift
//  CloneBithumb
//
//  Created by 김동율 on 9/28/24.
//

import UIKit
import RxSwift
import RxCocoa

class HeaderView: UIView {
    
    let firstBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("거래소", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let secondBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("시장동향", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    /// 시스템아이콘크키를 변형할 수 없어서 할 수 없이 작게 사용함.
    let thirdBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let fourthBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bell"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let fifthBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "gearshape"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let headerViewModel = HeaderViewModel()
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        bindBtnActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        bindBtnActions()
    }
    
    private func setupView() {
        backgroundColor = .white
        [firstBtn, secondBtn, thirdBtn, fourthBtn, fifthBtn].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            /// stackview로 해도 되지만, 하나씩 잡아줌. 추후에 환경설정만 보여야되는 VC가 있던데 그때는 스텍뷰로 할 것.
            firstBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            firstBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            secondBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            secondBtn.leadingAnchor.constraint(equalTo: firstBtn.trailingAnchor, constant: 20),
            
            thirdBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            thirdBtn.trailingAnchor.constraint(equalTo: fourthBtn.leadingAnchor, constant: -15),
            
            fourthBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            fourthBtn.trailingAnchor.constraint(equalTo: fifthBtn.leadingAnchor, constant: -15),

            fifthBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            fifthBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
        ])
    }
    
    private func bindBtnActions() {
        /// input, output설정.
        let input = HeaderViewModel.Input(
            firstBtnTapped: firstBtn.rx.tap.asObservable(),
            secondBtnTapped: secondBtn.rx.tap.asObservable(),
            thirdBtnTapped: thirdBtn.rx.tap.asObservable(),
            fourthBtnTapped: fourthBtn.rx.tap.asObservable(),
            fifthBtnTapped: fifthBtn.rx.tap.asObservable()
        )
        
        let output = headerViewModel.transform(input: input)
        
        output.moveToOneVC
            .subscribe(onNext: { [weak self] in
                guard let self else { return }
                self.navigateToVC(viewController: OneVC())
            })
            .disposed(by: disposeBag)
        
        output.moveToTwoVC
            .subscribe(onNext: { [weak self] in
                guard let self else { return }
                self.navigateToVC(viewController: TwoVC())
            })
            .disposed(by: disposeBag)
        
        output.moveToThreeVC
            .subscribe(onNext: { [weak self] in
                guard let self else { return }
                self.navigateToVC(viewController: ThreeVC())
            })
            .disposed(by: disposeBag)
        
        output.moveToFourVC
            .subscribe(onNext: { [weak self] in
                guard let self else { return }
                self.navigateToVC(viewController: FourVC())
            })
            .disposed(by: disposeBag)
        
        output.moveToFiveVC
            .subscribe(onNext: { [weak self] in
                guard let self else { return }
                self.navigateToVC(viewController: FiveVC())
            })
            .disposed(by: disposeBag)
    }

    /// 뭔가 방식이 복잡해서 다음시간에 이거 할 것. 페이지 이동 자연스럽게...
    private func navigateToVC(viewController: UIViewController) {
        guard let parentVC = self.parentViewController else { return }
        viewController.modalPresentationStyle = .fullScreen
        parentVC.present(viewController, animated: true, completion: nil)
    }
    
}

extension UIView {
    /// View는 VC를 참조하지 않음. 그래서 찾아줘야함. 클로저기법이랑 비슷했는데 자세히보니, Getter가져오는 프로퍼티였음.
    /// var parentViewController: UIViewController? {}
    /// UIResponder.next가 VC에 접근하는 것.
    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        for _ in 0..<Int.max {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            responder = responder?.next
            if responder == nil { break }
        }
        return nil
    }
}
