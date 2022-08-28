//
//  ViewControllerProvider.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import UIKit

final class ViewControllerProvider {
    let sessionManager = URLSessionManager()
    let downloadManager = DownloadManager()
    init() {}

    func countryListViewController() -> CountryListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: "CountryListViewController")
                as? CountryListViewController else {
            fatalError("viewController was not an instance of CountryListViewController")
        }
        let viewModel = CountryListViewModel(with: CountryWebService(with: sessionManager),
                                             downloadManager: downloadManager)
        viewController.viewModel = viewModel
        return viewController
    }

    func  countryDetailViewController(with name: String) -> CountryDetailViewController {
        let storyboard = UIStoryboard(name: "CountryDetailViewController", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "CountryDetailViewController")
                as? CountryDetailViewController else {
            fatalError("viewController was not an instance of CountryDetailViewController")
        }
        let viewModel = CountryViewModel(with: "peru",
                                         webService: CountryWebService(with: sessionManager),
                                         downloadManager: downloadManager)
        viewController.viewModel = viewModel
        return viewController
    }
}
