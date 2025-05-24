//
//  DetailCoinView.swift
//  TestApp
//
//  Created by Vadim on 24.05.2025.
//

import UIKit

class DetailCoinView: UIViewController {

    let backButton = UIButton()
    let logoutButton = UIButton()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let changeLabel = UILabel()
    let changeImageView = UIImageView()
    
    let statisticView = UIView()
    let statisticLabel = UILabel()
    let capitalizationLabel = UILabel()
    let capitalizationDataLabel = UILabel()
    let suplyLabel = UILabel()
    let suplyDataLabel = UILabel()
    
    let viewModel: DetailCoinViewModel
    
    init(viewModel: DetailCoinViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
}

//MARK: Setup UI

extension DetailCoinView {
    func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        setupBackButton()
        setupTitleLabel()
        setupLogoutButton()
        setupPriceLabel()
        setupChangeLabel()
        setupChangeImageView()
        setupStatisticView()
        setupStatiscticLabel()
        setupCapitalizationLabel()
        setupCapitalizationDataLabel()
        setupSuplyLabel()
        setupSuplyDataLabel()
    }
    
    func setupBackButton() {
        backButton.layer.cornerRadius = 24
        backButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8008467314)
        let image = UIImage(named: "backIcon")?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(image, for: .normal)
        backButton.tintColor = #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
    }
    
    func setupTitleLabel() {
        let attributedString = NSAttributedString(string: viewModel.title, attributes: [
            .font: UIFont(name: "Poppins Medium", size: 14)!,
            .foregroundColor: #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        ])
        titleLabel.attributedText = attributedString
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
    }
    
    func setupLogoutButton() {
        logoutButton.layer.cornerRadius = 24
        logoutButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8008467314)
        let image = UIImage(named: "logout")?.withRenderingMode(.alwaysTemplate)
        logoutButton.setImage(image, for: .normal)
        logoutButton.tintColor = #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        view.addSubview(logoutButton)
    }

    func setupPriceLabel() {
        let attributedString = NSAttributedString(string: viewModel.price, attributes: [
            .font: UIFont(name: "Poppins Medium", size: 28)!,
            .foregroundColor: #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        ])
        priceLabel.attributedText = attributedString
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceLabel)
    }
    
    func setupChangeLabel() {
        let attributedString = NSAttributedString(string: viewModel.changeData, attributes: [
            .font: UIFont(name: "Poppins Medium", size: 14)!,
            .foregroundColor: #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1)
        ])
        changeLabel.attributedText = attributedString
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(changeLabel)
    }
    
    func setupChangeImageView() {
        changeImageView.image = viewModel.changeImage
        changeImageView.contentMode = .scaleAspectFit
        changeImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(changeImageView)
    }
    
    func setupStatisticView() {
        statisticView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8008467314)
        statisticView.layer.cornerRadius = 40
        statisticView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statisticView)
    }
    
    func setupStatiscticLabel() {
        let attributedString = NSAttributedString(string: "Market Statistic", attributes: [
            .font: UIFont(name: "Poppins Medium", size: 20)!,
            .foregroundColor: #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        ])
        statisticLabel.attributedText = attributedString
        statisticLabel.translatesAutoresizingMaskIntoConstraints = false
        statisticView.addSubview(statisticLabel)
    }
    
    func setupCapitalizationLabel() {
        let attributedString = NSAttributedString(string: "Market capitalization", attributes: [
            .font: UIFont(name: "Poppins Medium", size: 14)!,
            .foregroundColor: #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1)
        ])
        capitalizationLabel.attributedText = attributedString
        capitalizationLabel.translatesAutoresizingMaskIntoConstraints = false
        statisticView.addSubview(capitalizationLabel)
    }
    
    func setupCapitalizationDataLabel() {
        let attributedString = NSAttributedString(string: viewModel.formatCapitalization(), attributes: [
            .font: UIFont(name: "Poppins Bold", size: 14)!,
            .foregroundColor: #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        ])
        capitalizationDataLabel.attributedText = attributedString
        capitalizationDataLabel.translatesAutoresizingMaskIntoConstraints = false
        statisticView.addSubview(capitalizationDataLabel)
    }
    
    func setupSuplyLabel() {
        let attributedString = NSAttributedString(string: "Circulating Suply", attributes: [
            .font: UIFont(name: "Poppins Medium", size: 14)!,
            .foregroundColor: #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1)
        ])
        suplyLabel.attributedText = attributedString
        suplyLabel.translatesAutoresizingMaskIntoConstraints = false
        statisticView.addSubview(suplyLabel)
    }
    
    func setupSuplyDataLabel() {
        let attributedString = NSAttributedString(string: viewModel.formatSuply(), attributes: [
            .font: UIFont(name: "Poppins Bold", size: 14)!,
            .foregroundColor: #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        ])
        suplyDataLabel.attributedText = attributedString
        suplyDataLabel.translatesAutoresizingMaskIntoConstraints = false
        statisticView.addSubview(suplyDataLabel)
    }
}

//MARK: Setup Constraints

extension DetailCoinView {

    func setupConstraints() {
        setupBackButtonConstraints()
        setupTitleLabelConstraints()
        setupLogoutButtonConstraints()
        setupPriceLabelConstraints()
        setupChangeLabelConstraints()
        setupChangeImageViewConstraints()
        setupStatisticViewConstraints()
        setupStatisticLabel()
        setupCapitalizationLabelConstraints()
        setupSuplyLabelConstraints()
        setupCapitalizationDataLabelConstraints()
        setupSuplyDataLabelConstraints()
    }
    
    func setupBackButtonConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            backButton.heightAnchor.constraint(equalToConstant: 48),
            backButton.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor)
        ])
    }
    
    func setupLogoutButtonConstraints() {
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            logoutButton.heightAnchor.constraint(equalToConstant: 48),
            logoutButton.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupChangeLabelConstraints() {
        NSLayoutConstraint.activate([
            changeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16)
        ])
    }
    
    func setupChangeImageViewConstraints() {
        NSLayoutConstraint.activate([
            changeImageView.centerYAnchor.constraint(equalTo: changeLabel.centerYAnchor),
            changeImageView.trailingAnchor.constraint(equalTo: changeLabel.leadingAnchor, constant: -4),
            changeImageView.heightAnchor.constraint(equalToConstant: 12),
            changeImageView.widthAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    func setupStatisticViewConstraints() {
        NSLayoutConstraint.activate([
            statisticView.heightAnchor.constraint(equalToConstant: 242),
            statisticView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statisticView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statisticView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupStatisticLabel() {
        NSLayoutConstraint.activate([
            statisticLabel.leadingAnchor.constraint(equalTo: statisticView.leadingAnchor, constant: 25),
            statisticLabel.topAnchor.constraint(equalTo: statisticView.topAnchor, constant: 25)
        ])
    }
    
    func setupCapitalizationLabelConstraints() {
        NSLayoutConstraint.activate([
            capitalizationLabel.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 25),
            capitalizationLabel.leadingAnchor.constraint(equalTo: statisticView.leadingAnchor, constant: 25)
        ])
    }
    
    func setupSuplyLabelConstraints() {
        NSLayoutConstraint.activate([
            suplyLabel.topAnchor.constraint(equalTo: capitalizationLabel.bottomAnchor, constant: 25),
            suplyLabel.leadingAnchor.constraint(equalTo: statisticView.leadingAnchor, constant: 25)
        ])
    }
    
    func setupCapitalizationDataLabelConstraints() {
        NSLayoutConstraint.activate([
            capitalizationDataLabel.centerYAnchor.constraint(equalTo: capitalizationLabel.centerYAnchor),
            capitalizationDataLabel.trailingAnchor.constraint(equalTo: statisticView.trailingAnchor, constant: -25)
        ])
    }
    
    func setupSuplyDataLabelConstraints() {
        NSLayoutConstraint.activate([
            suplyDataLabel.centerYAnchor.constraint(equalTo: suplyLabel.centerYAnchor),
            suplyDataLabel.trailingAnchor.constraint(equalTo: statisticView.trailingAnchor, constant: -25)
        ])
    }
}

//MARK: Button functions

extension DetailCoinView {
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func logoutButtonTapped() {
        
    }
}
