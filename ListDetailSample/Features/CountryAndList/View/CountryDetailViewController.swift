//
//  CountryDetailViewController.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation
import UIKit
import Combine

final class CountryDetailViewController: BaseViewController<CountryViewModel> {
    // MARK: Private members
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    private var activityIndicator: UIActivityIndicatorView!
    // Update server data every 30 seconds
    private let serviceUpdateDelay = 30.0

    // MARK: - View life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()

        if let name = viewModel?.countryName {
            fetchCountry(countryName: name)
        }
        setupLoader()
    }

    // MARK: - ViewModel life cycle
    public override func bindViewModel(_ viewModel: CountryViewModel) {
        viewModel.reloadData
            .sink(receiveValue: { [weak self] reloadData in
                guard let `self` = self else {
                    return
                }

                if reloadData {
                    self.titleLabel.text = viewModel.viewPresentationModel?.officialName
                    self.subTitleLabel.text = viewModel.viewPresentationModel?.population
                    self.descriptionLabel.text = viewModel.viewPresentationModel?.name

                    if let downloadManager = viewModel.downloader, let imageURL = viewModel.viewPresentationModel?.imageUrl {
                        self.setup(with: imageURL, downloadManager: downloadManager)
                    }
                    self.imageView.image = UIImage(named: "unknown")
                }
                self.showLoading(!reloadData)
            }).store(in: &cancellable)
    }

    private func setup(with imageURL: String, downloadManager: DownloadManagerServicing) {
        downloadManager.download(from: URL(string: imageURL)!)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self.imageView.image = UIImage(named: "unknown")
                }
            }, receiveValue: { [weak self] (data) in
                guard let `self` = self else {
                    return
                }
                if let data = data {
                    self.imageView.image = UIImage(data: data)
                }
            }).store(in: &cancellable)
    }

    private func setupLoader() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func showLoading(_ show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }

    private func fetchCountry(countryName: String) {
        viewModel?.fetchCountry(name: countryName)

        DispatchQueue.main.asyncAfter(deadline: .now() + serviceUpdateDelay) { [weak self] in
            self?.fetchCountry(countryName: countryName)
        }
    }
}
