//
//  ErrorHandler.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation
import UIKit

public class ErrorHandler {
    public func handleError(_ error: Error) -> UIAlertController? {
        // Here we can handle different types of errors, for now i'm showing just network error message
        let alert = UIAlertController(title: "network.error.title".localized,
                                      message: "network.error.message".localized,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "error.message.ok.title".localized,
                                      style: .default,
                                      handler: nil))
        return alert
    }
}
