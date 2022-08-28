//
//  ViewModel.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation
import Combine

open class ViewModel: NSObject {
    @Published public var errorPublisher: Error?

    var cancellable = Set<AnyCancellable>()

    open func handleError(_ error: Error) {
        errorPublisher = error
    }
}
