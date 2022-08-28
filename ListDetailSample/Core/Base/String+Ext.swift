//
//  String.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, comment: "")
    }
}
