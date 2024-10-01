//
//  MainVC.swift
//  CloneBithumb
//
//  Created by 김동율 on 9/27/24.
//

/*
 처음에는 그냥 전체를 하나의 vc로 했으나, 테이블뷰를 넣을때 처음부터 전체뷰가 헤더뷰 아래쪽까지 덮게 한다면 테이블뷰를 그냥 tableview.frame = slef.view.bounds로 하는게 편할거 같음.
 */

import Foundation
import UIKit
import RxSwift
import RxCocoa

class OneVC: BaseVC {
    
    let oneTableView = UITableView()
    let disposeBag = DisposeBag()
    let oneViewModel = OneViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        view.backgroundColor = .red
    }
    
    private func setTableView() {
        oneTableView.frame = view.bounds
        oneTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        oneTableView.dataSource = self
        oneTableView.delegate = self
        view.addSubview(oneTableView)
        oneTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension OneVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
