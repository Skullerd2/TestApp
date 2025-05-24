//
//  CurrencyModel.swift
//  TestApp
//
//  Created by Vadim on 24.05.2025.
//

import Foundation

struct CurrencyModel: Decodable {
    let data: DataModel
}

struct DataModel: Decodable {
    let name: String
    let symbol: String
    let marketData: MarketData
    let marketcap: MarketCapitalization
    let supply: Supply
    
}

struct MarketData: Decodable {
    let priceUsd: Float
    let percentChangeUsdLast24Hours: Float
}

struct MarketCapitalization: Decodable {
    let currentMarketcapUsd: Float
}

struct Supply: Decodable {
    let circulating: Int
}

