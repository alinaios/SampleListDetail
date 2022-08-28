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
    var viewPresentationModel: CountryCellPresentationModel?
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
            }, receiveValue: { [weak self] (countryEntity) in
                guard let `self` = self else {
                    return
                }
                self.viewPresentationModel = CountryCellPresentationModel(title: countryEntity.name.official,
                                                                          imageUrl: countryEntity.flags.png)
                self.reloadData.send(true)
            }).store(in: &cancellable)
    }
}
