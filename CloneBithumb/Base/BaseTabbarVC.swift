//
//  BaseTabbarVC.swift
//  CloneBithumb
//
//  Created by 김동율 on 9/27/24.
//

import Foundation
import UIKit
import RxSwift

class BaseTabbarVC: UITabBarController, UITabBarControllerDelegate {
    
    let disposeBag = DisposeBag()
    let headerViewHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 일단 그레이색상
        tabBar.backgroundColor = .gray
        setDelegate()
        setTabbarControllers()
        setHeaderView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    /// 일단 만들어놓음. 추후에 사용할 필요 없으면 삭제 할 것.
    private func setDelegate() {
        self.delegate = self
    }
    
    ///  페이지이동이 지금 가장 힘들다. 
    private func setTabbarControllers() {
        let exchangeVC = ExchangeVC()
        let twoVC = TwoVC()
        let threeVC = ThreeVC()
        let fourVC = FourVC()
        let fiveVC = FiveVC()
        exchangeVC.tabBarItem = UITabBarItem(title: "One", image: UIImage(named: ""), tag: 0)
        twoVC.tabBarItem = UITabBarItem(title: "Two", image: UIImage(named: ""), tag: 1)
        threeVC.tabBarItem = UITabBarItem(title: "Three", image: UIImage(named: ""), tag: 2)
        fourVC.tabBarItem = UITabBarItem(title: "Four", image: UIImage(named: ""), tag: 3)
        fiveVC.tabBarItem = UITabBarItem(title: "Five", image: UIImage(named: ""), tag: 4)
        
        self.viewControllers = [exchangeVC, twoVC, threeVC, fourVC, fiveVC]
    }
    
    /// NavigationController가 아닌 것 같아서 상단헤더뷰 만듬.
    private func setHeaderView() {
        
        let headerView = HeaderView()
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerViewHeight)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 처음 한번 ui업데이트 호출
        adjustViewFrames()
    }
        
    private func adjustViewFrames() {
        for viewController in viewControllers ?? [] {
            viewController.view.frame = CGRect(
                x: 0,
                y: headerViewHeight,
                width: view.frame.width,
                height: view.frame.height - headerViewHeight - tabBar.frame.height
            )
        }
    }
        
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // 탭이 전환될 때 마다 해당 뷰 컨트롤러에 이벤트 처리 가능
        print("Selected tab: \(viewController)")
        // present형식이라서 ui가 업데이트 안되어서 각 탭을 눌렀을때 ui업데이트 함수로 만들어서 호출함
        adjustViewFrames()
    }
    
}

