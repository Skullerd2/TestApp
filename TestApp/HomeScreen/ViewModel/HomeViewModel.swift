//
//  HomeViewModel.swift
//  TestApp
//
//  Created by Vadim on 23.05.2025.
//

import Foundation

class HomeViewModel {
    
    let networkManager = NetworkManager.shared
    
    let isSortedByAscendingOrder = false
    var currencyViewModels: [CurrencyCellViewModel] = []
    
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
        
        dispatchGroup.notify(queue: .main) {
            for currency in currencies {
                if let result = results[currency] {
                    switch result {
                    case .success(let data):
                        print("\(currency): \(data)")
                    case .failure(let error):
                        print("\(currency): Error - \(error.localizedDescription)")
                    }
                } else {
                    print("\(currency): No result")
                }
            }
        }
    }

}
