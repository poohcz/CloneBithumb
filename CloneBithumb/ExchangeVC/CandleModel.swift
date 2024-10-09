//
//  CandleModel.swift
//  CloneBithumb
//
//  Created by 김동율 on 10/9/24.
//

import Foundation
import UIKit

struct CandleModel: Codable {
    var market: String
    var candle_date_time_utc: String
    var candle_date_time_kst: String
    var opening_price: Double
    var high_price: Double
    var low_price: Double
    var trade_price: Double
    var timestamp: Int
    var candle_acc_trade_price: Double
    var candle_acc_trade_volume: Double
    var unit: Int
}

