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
        setupUI()
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
        moreButton.setImage(UIImage(named: "moreButtonIcon"), for: .normal)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moreButton)
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
        let normalTitle = NSAttributedString(string: "Login", attributes: [
            .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 1),
            .font: UIFont(name: "Poppins Bold", size: 15)!
        ])
        let onTapTitle = NSAttributedString(string: "Login", attributes: [
            .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 0.5),
            .font: UIFont(name: "Poppins Bold", size: 15)!
        ])
        
        moreButton.setAttributedTitle(normalTitle, for: .normal)
        moreButton.setAttributedTitle(onTapTitle, for: .highlighted)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moreButton)
    }
    
    func setupListOfCurrencyView() {
        listOfCurrencyView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9803921569, alpha: 1)
        listOfCurrencyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listOfCurrencyView)
    }
    
    func setupTrendingLabel() {
        trendingLabel.attributedText = NSAttributedString(string: "Login", attributes: [
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
        currencyTableView.translatesAutoresizingMaskIntoConstraints = false
        currencyTableView.backgroundColor = .clear
        currencyTableView.separatorStyle = .none
        listOfCurrencyView.addSubview(currencyTableView)
    }
}

//MARK: TableView

extension HomeView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
