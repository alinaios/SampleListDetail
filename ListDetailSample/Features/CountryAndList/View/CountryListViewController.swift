//
//  CountryListViewController.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation
import UIKit
import Combine

final class CountryListViewController: BaseViewController<CountryListViewModel>,
                                       UITableViewDelegate,
                                       UITableViewDataSource {
    // MARK: Private members
    @IBOutlet private weak var countriesTableView: UITableView!

    private var activityIndicator: UIActivityIndicatorView!
    // Update server data every 30 seconds
    private let serviceUpdateDelay = 30.0

    // MARK: - View life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        fetchCountries()
        setupLoader()
    }

    // MARK: - ViewModel life cycle
    public override func bindViewModel(_ viewModel: CountryListViewModel) {
        viewModel.reloadData
            .sink(receiveValue: { [weak self] reloadData in
                guard let `self` = self else {
                    return
                }
                if reloadData {
                    self.countriesTableView.reloadData()
                }
                self.showLoading(!reloadData)
            }).store(in: &cancellable)
    }

    // MARK: - TableView dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = viewModel?.dataSource else {
            return 0
        }
        return dataSource.count
    }

    // MARK: - TableView delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        guard let cellModel = viewModel?.dataSource[indexPath.row] else {
            return UITableViewCell()
        }
        if let cell = cell as? CountryCell, let downloadManager = viewModel?.downloadManager {
            cell.setup(with: cellModel, downloadManager: downloadManager)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel?.dataSource[indexPath.row], let countryName = viewModel.title else {
            return
        }
        let viewController =  viewControllerProvider.countryDetailViewController(with: countryName)
        navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: Private helpers
    private func setupTableView() {
        countriesTableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
    }

    private func setupLoader() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

    private func showLoading(_ show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }

    private func fetchCountries() {
        viewModel?.fetchCountryList()

        DispatchQueue.main.asyncAfter(deadline: .now() + serviceUpdateDelay) {
            self.fetchCountries()
        }
    }
}
