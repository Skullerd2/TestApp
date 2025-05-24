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
    let suply: Float
    
    init(title: String, price: String, changeImage: UIImage, changeData: String, capitalization: Float, suply: Float) {
        self.title = title
        self.price = price
        self.changeImage = changeImage
        self.changeData = changeData
        self.capitalization = capitalization
        self.suply = suply
    }
}

//MARK: Formatting

extension DetailCoinViewModel {
    
    func formatCapitalization() -> String {
        return "12442"
    }
    
    func formatSuply() -> String {
        return "1421"
    }

}

//MARK: - Defaults

extension DetailCoinViewModel {
    func setAuthorizedFlag() {
        defaults.set(false, forKey: "isAuth")
    }
}
