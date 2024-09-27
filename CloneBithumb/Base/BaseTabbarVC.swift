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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setTabbarControllers()
        setHeaderView()
    }
    
    /// NavigationController가 아닌 것 같아서 상단헤더뷰 만듬.
    private func setHeaderView() {
        var headerViewHeight: CGFloat = 100
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
    
    /// 일단 만들어놓음. 추후에 사용할 필요 없으면 삭제 할 것.
    private func setDelegate() {
        self.delegate = self
    }
    
    /// 이름 짓기 힘들어서
    private func setTabbarControllers() {
        let oneVC = OneVC()
        let twoVC = TwoVC()
        let threeVC = ThreeVC()
        let fourVC = FourVC()
        let fiveVC = FiveVC()
        oneVC.tabBarItem = UITabBarItem(title: "One", image: UIImage(named: ""), tag: 0)
        twoVC.tabBarItem = UITabBarItem(title: "Two", image: UIImage(named: ""), tag: 1)
        threeVC.tabBarItem = UITabBarItem(title: "Three", image: UIImage(named: ""), tag: 2)
        fourVC.tabBarItem = UITabBarItem(title: "Four", image: UIImage(named: ""), tag: 3)
        fiveVC.tabBarItem = UITabBarItem(title: "Five", image: UIImage(named: ""), tag: 4)
        
        self.viewControllers = [oneVC, twoVC, threeVC, fourVC, fiveVC]
    }
    
}

