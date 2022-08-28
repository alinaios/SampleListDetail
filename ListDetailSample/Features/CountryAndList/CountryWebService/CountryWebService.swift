//
//  CountryWebService.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation
import Combine

final class CountryWebService: DataFetchManager {
    func fetch(with parameters: CountryListParameter) -> AnyPublisher<[Country], Error> {
        return execute(parameters, errorType: Error.self)
    }

    func fetch(with parameters: CountryParameter) -> AnyPublisher<[Country], Error> {
        return execute(parameters, errorType: Error.self)
    }
}
