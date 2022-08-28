//
//  CountryListParameter.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation

struct CountryListParameter {}

extension CountryListParameter: Routing {
    var method: RequestType {
        return .GET
    }

    var routPath: String {
        return "v3.1/all"
    }
}
