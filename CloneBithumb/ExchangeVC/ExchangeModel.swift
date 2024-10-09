//
//  ExchangeModel.swift
//  CloneBithumb
//
//  Created by 김동율 on 10/3/24.
//

import Foundation
import UIKit

struct ExchangeModel: Codable {
    let market: String
    let korean_name: String
    let english_name: String
    // 하... nil이 들어올줄은... optinal로 처리
    let market_warning: String?
    
    // candles
}
