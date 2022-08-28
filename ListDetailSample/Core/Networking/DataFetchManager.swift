//
//  DataFetchManager.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation
import Combine

class DataFetchManager {

    let sessionManager: URLSessionManager

    init(with sessionManager: URLSessionManager) {
        self.sessionManager = sessionManager
    }

    func execute<T: Decodable, R: Routing, E: Error>(_ route: R, errorType: E.Type) -> AnyPublisher<T, Error> {
        return self.sessionManager.fetch(route)
    }
}
