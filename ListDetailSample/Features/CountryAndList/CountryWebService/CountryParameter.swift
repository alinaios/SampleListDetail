//
//  CountryParameter.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation

struct CountryParameter {
    let countryName: String
}

extension CountryParameter: Routing {
    var method: RequestType {
        return .GET
    }

    var routPath: String {
        return "v3.1/name/\(countryName)"
    }
}
