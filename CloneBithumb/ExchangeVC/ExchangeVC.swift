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

class ExchangeVC: BaseVC {
    
    let exchangeTableView = UITableView()
    let disposeBag = DisposeBag()
    let viewModel = ExchangeViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getList()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTableView()
    }
    
    private func setTableView() {
        exchangeTableView.backgroundColor = .white
        exchangeTableView.frame = view.bounds
        exchangeTableView.register(ExchangeTableViewCell.self, forCellReuseIdentifier: ExchangeTableViewCell.identifier)
        view.addSubview(exchangeTableView)
        exchangeTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func getList() {
        // 항상 subscribe, disposed 까먹지 말것.
        // ExchangeData가져오기
        viewModel.getExchangeData()
        viewModel.exchangeData
            .observe(on: MainScheduler.instance)
            .bind(to: exchangeTableView.rx.items(
                cellIdentifier: ExchangeTableViewCell.identifier, cellType: ExchangeTableViewCell.self
            )) { index, model, cell in
                cell.titleKorLabel.text = model.korean_name
                cell.titleEngLabel.text = model.english_name
            }
            .disposed(by: disposeBag)
        
        // ExchangeData가져오기
        viewModel.getCandle()
        
        
    }
    
    
    /*
     //            .subscribe(onNext: { [weak self] exchangeData in
     //                guard let self = self else { return }
     //                self.updateVC(data: exchangeData)
     //            })
                   .bind기능안에 subscribe가 들어있다. 바로 바인드가 가능하므로, tableviewdelegate선언을 할 필요가 없다. 다른 vc에서 할때 연습해보자.
     */
    
}

