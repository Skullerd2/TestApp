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
}
