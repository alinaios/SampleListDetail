//
//  CountryListViewModel.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation
import Combine

final class CountryListViewModel: ViewModel {
    // MARK: Public members
    var reloadData = PassthroughSubject<Bool, Never>()
    var dataSource = [CountryPresentationModel]()
    let downloadManager: DownloadManagerServicing?

    // MARK: Private members
    private let webService: CountryWebService?

    init(with webService: CountryWebService, downloadManager: DownloadManagerServicing) {
        self.webService = webService
        self.downloadManager = downloadManager
    }

    // MARK: Public API
    func fetchCountryList() {
        let parameters = CountryListParameter()

        webService?
            .fetch(with: parameters)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.handleError(error)
                }
            }, receiveValue: { [weak self] (list) in
                guard let `self` = self else {
                    return
                }
                self.dataSource = list.sorted().map({
                    CountryPresentationModel(name: $0.name.common,
                                             officialName: $0.name.official,
                                             imageUrl: $0.flags.png,
                                             population: String($0.population),
                                             region: $0.region.rawValue)
                })
                self.reloadData.send(true)
            }).store(in: &cancellable)
    }
}
