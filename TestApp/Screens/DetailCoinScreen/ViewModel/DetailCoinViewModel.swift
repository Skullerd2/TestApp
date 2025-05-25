//
//  DetailCoinViewModel.swift
//  TestApp
//
//  Created by Vadim on 24.05.2025.
//

import UIKit

class DetailCoinViewModel {
    
    let defaults = UserDefaults.standard
    
    let title: String
    let price: String
    let changeImage: UIImage
    let changeData: String
    let capitalization: Float
    let description: String
    let suply: Float
    
    init(title: String, price: String, changeImage: UIImage, changeData: String, capitalization: Float, description: String, suply: Float) {
        self.title = title
        self.price = price
        self.changeImage = changeImage
        self.changeData = changeData
        self.capitalization = capitalization
        self.description = description
        self.suply = suply
    }
}

//MARK: Formatting

extension DetailCoinViewModel {
    
    func formatCapitalization(scale: Float = 1.0, localeIdentifier: String = "en_US") -> String {
        let scaledValue = capitalization / scale
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.locale = Locale(identifier: localeIdentifier)
        
        return formatter.string(from: NSNumber(value: scaledValue)) ?? "$0.00"
    }
    
    func formatSuply(scale: Float = 1.0, localeIdentifier: String = "en_US") -> String {
        let scaledValue = suply / scale
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.locale = Locale(identifier: localeIdentifier)
        
        let formattedNumber = formatter.string(from: NSNumber(value: scaledValue)) ?? "0.00"
        return "\(formattedNumber) \(description)"
    }
}

//MARK: - Defaults

extension DetailCoinViewModel {
    func setAuthorizedFlag() {
        defaults.set(false, forKey: "isAuth")
    }
}
