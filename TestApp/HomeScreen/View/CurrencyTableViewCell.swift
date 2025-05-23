//
//  CurrencyTableViewCell.swift
//  TestApp
//
//  Created by Vadim on 23.05.2025.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    let currencyImageView = UIImageView()
    let labelContainer = UIView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let changingContainer = UIView()
    let changingImageView = UIImageView()
    let changingLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

//MARK: SetupUI

extension CurrencyTableViewCell {
    
}
