//
//  HomeView.swift
//  TestApp
//
//  Created by Vadim on 23.05.2025.
//

import UIKit

class HomeView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let homeLabel = UILabel()
    let menuButton = UIButton()
    let programLabel = UILabel()
    let moreButton = UIButton()
    let boxImageView = UIImageView()
    let listOfCurrencyView = UIView()
    let trendingLabel = UILabel()
    let sortButton = UIButton()
    let loadingActivityIndicator = UIActivityIndicatorView()
    let currencyTableView = UITableView()
    
    let viewModel: HomeViewModel
    
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        viewModel.fetchCurrencyData(currency: "btc")
        setupUI()
        setupConstraints()
    }

}

//MARK: Setup UI

extension HomeView {
    func setupUI() {
        view.backgroundColor = #colorLiteral(red: 1, green: 0.6039215686, blue: 0.6980392157, alpha: 1)
        setupHomeLabel()
        setupMenuButton()
        setupProgramLabel()
        setupMoreButton()
        setupBoxImageView()
        setupListOfCurrencyView()
        setupTrendingLabel()
        setupSortButton()
        setupTableView()
    }
    
    func setupHomeLabel() {
        homeLabel.attributedText = NSAttributedString(string: "Home", attributes: [
            .foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            .font : UIFont(name: "Poppins Bold", size: 32)!
        ])
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeLabel)
    }
    
    func setupMenuButton() {
        menuButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        menuButton.layer.cornerRadius = 24
        menuButton.setImage(.menuButtonIcon, for: .normal)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
    }
    
    func setupBoxImageView() {
        boxImageView.image = UIImage(named: "boxImage")
        boxImageView.contentMode = .scaleAspectFit
        boxImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(boxImageView)
    }
    
    func setupProgramLabel() {
        programLabel.attributedText = NSAttributedString(string: "Affiliate program", attributes: [
            .foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            .font : UIFont(name: "Poppins Medium", size: 20)!
        ])
        programLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(programLabel)
    }
    
    func setupMoreButton() {
        moreButton.backgroundColor = .white
        let normalTitle = NSAttributedString(string: "Learn more", attributes: [
            .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 1),
            .font: UIFont(name: "Poppins Bold", size: 15)!
        ])
        let onTapTitle = NSAttributedString(string: "Learn more", attributes: [
            .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 0.5),
            .font: UIFont(name: "Poppins Bold", size: 15)!
        ])
        
        moreButton.setAttributedTitle(normalTitle, for: .normal)
        moreButton.setAttributedTitle(onTapTitle, for: .highlighted)
        moreButton.layer.cornerRadius = 17.5
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moreButton)
    }
    
    func setupListOfCurrencyView() {
        listOfCurrencyView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9803921569, alpha: 1)
        listOfCurrencyView.layer.cornerRadius = 40
        listOfCurrencyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listOfCurrencyView)
    }
    
    func setupTrendingLabel() {
        trendingLabel.attributedText = NSAttributedString(string: "Trending", attributes: [
            .foregroundColor: #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1),
            .font: UIFont(name: "Poppins Medium", size: 20)!
        ])
        trendingLabel.translatesAutoresizingMaskIntoConstraints = false
        listOfCurrencyView.addSubview(trendingLabel)
    }
    
    func setupSortButton() {
        if viewModel.isSortedByAscendingOrder {
            sortButton.setImage(.sortDescendingOrder, for: .normal)
        } else {
            sortButton.setImage(.sortAscendingOrder, for: .normal)
        }
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        listOfCurrencyView.addSubview(sortButton)
    }
    
    func setupTableView() {
        currencyTableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: "CurrencyCell")
        currencyTableView.translatesAutoresizingMaskIntoConstraints = false
        currencyTableView.backgroundColor = .clear
        currencyTableView.separatorStyle = .none
        listOfCurrencyView.addSubview(currencyTableView)
    }
}

//MARK: Setup Constraints

extension HomeView {
    func setupConstraints() {
        setupHomeLabelConstraints()
        setupMenuButtonConstraints()
        setupProgramLabelConstraints()
        setupMoreButtonConstraints()
        setupBoxImageViewConstraints()
        setupListOfCurrencyViewConstraints()
        setupTrendingLabelConstraints()
        setupSortButtonConstraints()
        setupTableViewConstraints()
    }
    
    func setupHomeLabelConstraints() {
        NSLayoutConstraint.activate([
            homeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            homeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }
    
    func setupMenuButtonConstraints() {
        NSLayoutConstraint.activate([
            menuButton.centerYAnchor.constraint(equalTo: homeLabel.centerYAnchor),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            menuButton.heightAnchor.constraint(equalToConstant: 48),
            menuButton.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupProgramLabelConstraints() {
        NSLayoutConstraint.activate([
            programLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            programLabel.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 52),
        ])
    }
    
    func setupMoreButtonConstraints() {
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: programLabel.bottomAnchor, constant: 16),
            moreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            moreButton.heightAnchor.constraint(equalToConstant: 35),
            moreButton.widthAnchor.constraint(equalToConstant: 127)
        ])
    }
    
    func setupBoxImageViewConstraints() {
        NSLayoutConstraint.activate([
            boxImageView.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 22),
            boxImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
            boxImageView.heightAnchor.constraint(equalToConstant: 242),
            boxImageView.widthAnchor.constraint(equalToConstant: 242)
        ])
    }
    
    func setupListOfCurrencyViewConstraints() {
        NSLayoutConstraint.activate([
            listOfCurrencyView.topAnchor.constraint(equalTo: moreButton.bottomAnchor, constant: 46),
            listOfCurrencyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listOfCurrencyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listOfCurrencyView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTrendingLabelConstraints() {
        NSLayoutConstraint.activate([
            trendingLabel.leadingAnchor.constraint(equalTo: listOfCurrencyView.leadingAnchor, constant: 25),
            trendingLabel.topAnchor.constraint(equalTo: listOfCurrencyView.topAnchor, constant: 25)
        ])
    }
    
    func setupSortButtonConstraints() {
        NSLayoutConstraint.activate([
            sortButton.topAnchor.constraint(equalTo: listOfCurrencyView.topAnchor, constant: 25),
            sortButton.trailingAnchor.constraint(equalTo: listOfCurrencyView.trailingAnchor, constant: -25),
            sortButton.heightAnchor.constraint(equalToConstant: 24),
            sortButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            currencyTableView.topAnchor.constraint(equalTo: trendingLabel.bottomAnchor, constant: 16),
            currencyTableView.leadingAnchor.constraint(equalTo: listOfCurrencyView.leadingAnchor),
            currencyTableView.trailingAnchor.constraint(equalTo: listOfCurrencyView.trailingAnchor),
            currencyTableView.bottomAnchor.constraint(equalTo: listOfCurrencyView.bottomAnchor)
        ])
    }
}

//MARK: TableView

extension HomeView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? CurrencyTableViewCell else {
            fatalError("Could not dequeue CurrencyTableViewCell")
        }

        let viewModel = CurrencyCellViewModel(image: .bitcoin, title: "Bitcoin", description: "BTC", price: "$32,128.80", changingIcon: .growth, changingText: "2.5%")
        cell.configure(with: viewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
