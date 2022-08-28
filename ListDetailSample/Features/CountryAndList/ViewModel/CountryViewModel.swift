//
//  CountryViewModel.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation
import Combine

final class CountryViewModel: ViewModel {
    // MARK: Public members
    var reloadData = PassthroughSubject<Bool, Never>()
    var viewPresentationModel: CountryPresentationModel?
    let downloader: DownloadManagerServicing?
    let countryName: String

    // MARK: Private members
    private let service: CountryWebService?

    init(with name: String, webService: CountryWebService, downloadManager: DownloadManagerServicing) {
        service = webService
        downloader = downloadManager
        countryName = name
    }

    // MARK: Public API
    func fetchCountry(name: String) {
        let parameters = CountryParameter(countryName: name)

        service?
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
                if let aCountry = list.first {
                    self.viewPresentationModel = CountryPresentationModel(name: aCountry.name.common.lowercased(),
                                                                      officialName: aCountry.name.official,
                                                                      imageUrl: aCountry.flags.png,
                                                                      population: String(aCountry.population),
                                                                      region: aCountry.region.rawValue)
                }
                self.reloadData.send(true)
            }).store(in: &cancellable)
    }
}
