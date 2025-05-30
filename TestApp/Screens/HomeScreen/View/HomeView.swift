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
    
    let menuView = UIView()
    let updateImageView = UIImageView()
    let updateButton = UIButton()
    let logoutImageView = UIImageView()
    let logoutButton = UIButton()
    
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
        setupUI()
        setupConstraints()
        
        viewModel.fetchMultipleCurrenciesData()
        viewModel.onCurrenciesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.loadingActivityIndicator.isHidden.toggle()
                self?.currencyTableView.reloadData()
            }
        }
        
        viewModel.onCurrenciesSorted = { [weak self] in
            self?.currencyTableView.reloadData()
        }
    }
    
}

//MARK: Setup UI

extension HomeView {
    func setupUI() {
        view.backgroundColor = #colorLiteral(red: 1, green: 0.6039215686, blue: 0.6980392157, alpha: 1)
        setupHomeLabel()
        setupMenuButton()
        setupLogoutButton()
        setupUpdateButton()
        setupProgramLabel()
        setupMoreButton()
        setupBoxImageView()
        setupMenuView()
        setupListOfCurrencyView()
        setupTrendingLabel()
        setupSortButton()
        setupTableView()
        setupActivityIndicatorView()
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
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        view.addSubview(menuButton)
    }
    
    func setupMenuView() {
        menuView.layer.cornerRadius = 16
        menuView.backgroundColor = .white
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.isHidden = true
        view.addSubview(menuView)
    }
    
    func setupUpdateButton() {
        let normalTitle = NSAttributedString(string: "Обновить", attributes: [
            .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 1),
            .font: UIFont(name: "Poppins Regular", size: 18)!
        ])
        let onTapTitle = NSAttributedString(string: "Обновить", attributes: [
            .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 0.5),
            .font: UIFont(name: "Poppins Regular", size: 18)!
        ])
        updateButton.backgroundColor = .clear
        updateButton.setAttributedTitle(normalTitle, for: .normal)
        updateButton.setAttributedTitle(onTapTitle, for: .highlighted)
        updateButton.setImage(UIImage.update.withRenderingMode(.alwaysOriginal), for: .normal)
        updateButton.adjustsImageWhenHighlighted = false
        updateButton.semanticContentAttribute = .forceLeftToRight
        updateButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        menuView.addSubview(updateButton)
    }
    
    func setupLogoutButton() {
        let normalTitle = NSAttributedString(string: "Выйти", attributes: [
            .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 1),
            .font: UIFont(name: "Poppins Regular", size: 18)!
        ])
        let onTapTitle = NSAttributedString(string: "Выйти", attributes: [
            .foregroundColor: #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 0.5),
            .font: UIFont(name: "Poppins Regular", size: 18)!
        ])
        logoutButton.backgroundColor = .clear
        logoutButton.setAttributedTitle(normalTitle, for: .normal)
        logoutButton.setAttributedTitle(onTapTitle, for: .highlighted)
        logoutButton.setImage(UIImage.logout.withRenderingMode(.alwaysOriginal), for: .normal)
        logoutButton.adjustsImageWhenHighlighted = false
        logoutButton.semanticContentAttribute = .forceLeftToRight
        logoutButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        menuView.addSubview(logoutButton)
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
        sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        listOfCurrencyView.addSubview(sortButton)
    }
    
    func setupTableView() {
        currencyTableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: "CurrencyCell")
        currencyTableView.translatesAutoresizingMaskIntoConstraints = false
        currencyTableView.backgroundColor = .clear
        currencyTableView.separatorStyle = .none
        listOfCurrencyView.addSubview(currencyTableView)
    }
    
    func setupActivityIndicatorView() {
        loadingActivityIndicator.startAnimating()
        loadingActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        listOfCurrencyView.addSubview(loadingActivityIndicator)
    }
}

//MARK: Setup Constraints

extension HomeView {
    func setupConstraints() {
        setupHomeLabelConstraints()
        setupMenuButtonConstraints()
        setupMenuViewConstraints()
        setupUpdateButtonCostraints()
        setupLogoutButtonCostraints()
        setupProgramLabelConstraints()
        setupMoreButtonConstraints()
        setupBoxImageViewConstraints()
        setupListOfCurrencyViewConstraints()
        setupTrendingLabelConstraints()
        setupSortButtonConstraints()
        setupTableViewConstraints()
        setupActivityIndicator()
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
    
    func setupMenuViewConstraints() {
        NSLayoutConstraint.activate([
            menuView.heightAnchor.constraint(equalToConstant: 102),
            menuView.widthAnchor.constraint(equalToConstant: 157),
            menuView.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 8),
            menuView.trailingAnchor.constraint(equalTo: menuButton.trailingAnchor)
        ])
    }
    
    func setupUpdateButtonCostraints() {
        NSLayoutConstraint.activate([
            updateButton.heightAnchor.constraint(equalToConstant: 27),
            updateButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            updateButton.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 16)
        ])
    }
    
    func setupLogoutButtonCostraints() {
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalToConstant: 27),
            logoutButton.leadingAnchor.constraint(equalTo: updateButton.leadingAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: menuView.bottomAnchor, constant: -16)
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
    
    func setupActivityIndicator() {
        NSLayoutConstraint.activate([
            loadingActivityIndicator.centerXAnchor.constraint(equalTo: listOfCurrencyView.centerXAnchor),
            loadingActivityIndicator.centerYAnchor.constraint(equalTo: listOfCurrencyView.centerYAnchor)
        ])
    }
}

//MARK: TableView

extension HomeView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currencyViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? CurrencyTableViewCell else {
            fatalError("Could not dequeue CurrencyTableViewCell")
        }
        
        let currencyData = viewModel.currencyViewModels[indexPath.row]
        let cellViewModel = CurrencyCellViewModel(
            image: currencyData.image,
            title: currencyData.title,
            description: currencyData.description,
            price: currencyData.price,
            changingIcon: currencyData.changingIcon,
            changingText: currencyData.changingText)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = DetailCoinViewModel(
            title: "\(viewModel.currencyViewModels[indexPath.row].title) (\(viewModel.currencyViewModels[indexPath.row].description))",
            price: viewModel.currencyViewModels[indexPath.row].price,
            changeImage: viewModel.currencyViewModels[indexPath.row].changingIcon,
            changeData: viewModel.currencyViewModels[indexPath.row].changingText,
            capitalization: viewModel.currencyModels[indexPath.row].data.marketcap.currentMarketcapUsd,
            description: viewModel.currencyViewModels[indexPath.row].description,
            suply: viewModel.currencyModels[indexPath.row].data.supply.circulating
        )
        let view = DetailCoinView(viewModel: viewModel)
        navigationController?.pushViewController(view, animated: true)
    }
}

//MARK: Button functions

extension HomeView {
    @objc func menuButtonTapped() {
        changeMenuVisibility()
    }
    
    @objc func updateButtonTapped() {
        changeMenuVisibility()
        viewModel.updateCurrencyData()
    }
    
    @objc func logoutButtonTapped() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            view.endEditing(true)
            sceneDelegate.switchRootVCToLoginView()
            viewModel.setAuthorizedFlag()
        }
    }
    
    @objc func sortButtonTapped() {
        viewModel.sort()
    }
    
    func changeMenuVisibility() {
        if menuView.isHidden {
            menuView.alpha = 0
            menuView.isHidden = false
            UIView.animate(withDuration: 0.2) {
                self.menuView.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.menuView.alpha = 0
            }) { _ in
                self.menuView.isHidden = true
            }
        }
    }
}
