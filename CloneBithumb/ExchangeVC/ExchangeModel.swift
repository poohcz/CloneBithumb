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
    let market_warning: String
}
