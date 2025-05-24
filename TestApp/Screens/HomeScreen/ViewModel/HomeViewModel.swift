//
//  HomeViewModel.swift
//  TestApp
//
//  Created by Vadim on 23.05.2025.
//

import Foundation
import UIKit

class HomeViewModel {
    
    let networkManager = NetworkManager.shared
    
    let isSortedByAscendingOrder = false
    let isMenuButtonActive = false
    private(set) var sortedByAsc = false
    private(set) var currencyViewModels: [CurrencyCellViewModel] = []
    private(set) var currencyModels: [CurrencyModel] = []
    var onCurrenciesUpdated: (() -> Void)?
    var onCurrenciesSorted: (() -> Void)?
    
    func getImageForCurrency(currency: String) -> UIImage{
        switch currency {
        case "BTC":
            return .bitcoin
        case "ETH":
            return .eth
        case "TRX":
            return .trx
        case "luna":
            return .luna
        case "DOT":
            return .dot
        case "DOGE":
            return .doge
        case "USDT":
            return .usdt
        case "XLM":
            return .XLM
        case "ADA":
            return .ada
        case "XRP":
            return .xrp
        default:
            return .clearCoin
        }
    }
    
    func updateCurrencyData() {
        currencyViewModels = []
        currencyModels = []
        fetchMultipleCurrenciesData()
        onCurrenciesUpdated?()
    }
    
    func sort() {
        if sortedByAsc {
            currencyModels.sort { $0.data.marketData.priceUsd > $1.data.marketData.priceUsd }
        } else {
            currencyModels.sort { $0.data.marketData.priceUsd < $1.data.marketData.priceUsd }
        }
        sortedByAsc.toggle()
        currencyViewModels = []
        for i in 0..<currencyModels.count {
            formatDataForCell(data: currencyModels[i])
        }
        onCurrenciesSorted?()
    }
}


//MARK: Network

extension HomeViewModel {
    func fetchCurrencyData(currency: String) {
        networkManager.fetchCurrencyData(currency: currency) { result in
            switch result {
            case .success(let currency):
                print(currency)
            case .failure(let error):
                print("Error in fetching data: \(error)")
            }
        }
    }
    
    func fetchMultipleCurrenciesData() {
        let currencies = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
        let dispatchGroup = DispatchGroup()
        
        var results: [String: Result<CurrencyModel, Error>] = [:]
        let resultsQueue = DispatchQueue(label: "resultsQueue")

        for currency in currencies {
            dispatchGroup.enter()
            
            networkManager.fetchCurrencyData(currency: currency) { result in
                resultsQueue.async {
                    results[currency] = result
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            for currency in currencies {
                if let result = results[currency] {
                    switch result {
                    case .success(let data):
                        self?.formatDataForCell(data: data)
                        self?.currencyModels.append(data)
                    case .failure(let error):
                        print("\(currency): Error - \(error.localizedDescription)")
                    }
                } else {
                    print("\(currency): No result")
                }
            }
            self?.onCurrenciesUpdated?() 
        }
    }
}

//MARK: Formatting

extension HomeViewModel {
    func formatCurrency(_ value: Float, scale: Float = 1.0, localeIdentifier: String = "en_US") -> String {
        let scaledValue = value / scale
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.locale = Locale(identifier: localeIdentifier)
        
        return formatter.string(from: NSNumber(value: scaledValue)) ?? "$0.00"
    }
    
    func formatAsPercentage(_ value: Float) -> String {
        let absValue = abs(value)
        return String(format: "%.1f%%", absValue)
    }
    
    func formatDataForCell(data: CurrencyModel) {
        let currencyCellModel = CurrencyCellViewModel(
            image: getImageForCurrency(currency: data.data.symbol),
            title: data.data.name,
            description: data.data.symbol,
            price: formatCurrency(data.data.marketData.priceUsd),
            changingIcon: data.data.marketData.percentChangeUsdLast24Hours > 0 ? .growth : .decline,
            changingText: formatAsPercentage(data.data.marketData.percentChangeUsdLast24Hours))
        currencyViewModels.append(currencyCellModel)
    }
}
