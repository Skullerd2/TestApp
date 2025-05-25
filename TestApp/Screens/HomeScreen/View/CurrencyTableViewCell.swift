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
    let changingImageView = UIImageView()
    let changingLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with viewModel: CurrencyCellViewModel) {
        currencyImageView.image = viewModel.image
        titleLabel.attributedText = NSAttributedString(string: viewModel.title, attributes: [
            .foregroundColor : #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 1),
            .font : UIFont(name: "Poppins Medium", size: 18)!
        ])
        descriptionLabel.attributedText = NSAttributedString(string: viewModel.description, attributes: [
            .foregroundColor : #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1),
            .font : UIFont(name: "Poppins Medium", size: 14)!
        ])
        priceLabel.attributedText = NSAttributedString(string: viewModel.price, attributes: [
            .foregroundColor : #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 1),
            .font : UIFont(name: "Poppins Medium", size: 18)!
        ])
        changingLabel.attributedText = NSAttributedString(string: viewModel.changingText, attributes: [
            .foregroundColor : #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1),
            .font : UIFont(name: "Poppins Medium", size: 14)!
        ])
        changingImageView.image = viewModel.changingIcon
    }

}

//MARK: SetupUI

extension CurrencyTableViewCell {
    func setupUI() {
        setupCurrencyImageView()
        setupLabelContainer()
        setupTitleLabel()
        setupDescriptionLabel()
        setupPriceLabel()
        setupChangingLabel()
        setupChangingImageView()
    }
    
    func setupCurrencyImageView() {
        currencyImageView.contentMode = .scaleAspectFit
        currencyImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(currencyImageView)
    }
    
    func setupLabelContainer() {
        labelContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelContainer)
    }

    
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.addSubview(titleLabel)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.addSubview(descriptionLabel)
    }
    
    func setupPriceLabel() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.addSubview(priceLabel)
    }
    
    func setupChangingLabel() {
        changingLabel.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.addSubview(changingLabel)
    }
    
    func setupChangingImageView() {
        changingImageView.contentMode = .scaleAspectFit
        changingImageView.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.addSubview(changingImageView)
    }
}

//MARK: Setup Constraints

extension CurrencyTableViewCell {
    func setupConstraints() {
        setupCurrencyImageViewConstraints()
        setupLabelContainerConstraints()
        setupTitleLabelConstraints()
        setupDescriptionLabelConstraints()
        setupPriceLabelConstraints()
        setupChangingLabelConstraints()
        setupChangingImageViewConstraints()
    }
    
    func setupCurrencyImageViewConstraints() {
        NSLayoutConstraint.activate([
            currencyImageView.heightAnchor.constraint(equalToConstant: 50),
            currencyImageView.widthAnchor.constraint(equalToConstant: 50),
            currencyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            currencyImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupLabelContainerConstraints() {
        NSLayoutConstraint.activate([
            labelContainer.heightAnchor.constraint(equalToConstant: 50),
            labelContainer.leadingAnchor.constraint(equalTo: currencyImageView.trailingAnchor, constant: 16),
            labelContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            labelContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupTitleLabelConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: labelContainer.topAnchor)
        ])
    }
    
    func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor)
        ])
    }
    
    func setupPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: labelContainer.topAnchor)
        ])
    }
    
    func setupChangingLabelConstraints() {
        NSLayoutConstraint.activate([
            changingLabel.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor),
            changingLabel.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor)
        ])
    }
    
    func setupChangingImageViewConstraints() {
        NSLayoutConstraint.activate([
            changingImageView.trailingAnchor.constraint(equalTo: changingLabel.leadingAnchor, constant: -4),
            changingImageView.centerYAnchor.constraint(equalTo: changingLabel.centerYAnchor),
            changingImageView.heightAnchor.constraint(equalToConstant: 12),
            changingImageView.widthAnchor.constraint(equalToConstant: 12)
        ])
    }
}
