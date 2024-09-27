//
//  HeaderView.swift
//  CloneBithumb
//
//  Created by 김동율 on 9/28/24.
//

import UIKit

class HeaderView: UIView {
    
    let firstTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "거래소"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "시장동향"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let firstBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let secondBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let thirdBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .red
        
        [firstTitleLabel, secondTitleLabel, firstBtn, secondBtn, thirdBtn].forEach { addSubview($0) }
    }
    
}
