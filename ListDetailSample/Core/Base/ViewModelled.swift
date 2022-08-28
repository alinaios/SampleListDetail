//
//  ViewModelled.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation

public protocol ViewModelled {
    associatedtype T: ViewModel

    var viewModel: T? { get }

    func bindViewModel(_ viewModel: T)
}
