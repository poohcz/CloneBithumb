//
//  ExchangeTableViewCell.swift
//  CloneBithumb
//
//  Created by 김동율 on 10/4/24.
//

import Foundation
import UIKit
import RxSwift

class ExchangeTableViewCell: UITableViewCell {
    static let identifier: String = "ExchangeTableViewCell"
    
    let updownInParentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var updownView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var titleKorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var titleEngLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 서브뷰 추가
        addSubview(titleKorLabel)
        addSubview(titleEngLabel)
        
        // AutoLayout 설정
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        // titleKorLabel 제약 조건 설정
        NSLayoutConstraint.activate([
            titleKorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleKorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleKorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            // titleEngLabel 제약 조건 설정
            titleEngLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleEngLabel.topAnchor.constraint(equalTo: titleKorLabel.bottomAnchor, constant: 5),
            titleEngLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleEngLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10) // 아래 여백을 10으로 설정
        ])
    }
    
    
}
