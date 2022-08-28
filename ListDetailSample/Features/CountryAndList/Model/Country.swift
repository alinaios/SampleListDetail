//
//  Country.swift
//  ListDetailSample
//
//  Created by A H on 2022-08-28.
//

import Foundation

// MARK: - Country
struct Country: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String
    let ccn3: String?
    let cca3: String
    let cioc: String?
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: Currencies?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: Region
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let borders: [String]?
    let area: Double
    let demonyms: Demonyms?
    let flag: String
    let maps: Maps
    let population: Int
    let gini: [String: Double]?
    let fifa: String?
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags, coatOfArms: CoatOfArms
    let startOfWeek: StartOfWeek
    let capitalInfo: CapitalInfo
    let postalCode: PostalCode?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let eur, gtq, clp, uyu: Aed?
    let kgs, zmw, nzd, gel: Aed?
    let ttd, krw, usd, xof: Aed?
    let mkd, fjd, mga, xcd: Aed?
    let aud, crc, dzd, nio: Aed?
    let zwl, rwf, currenciesTRY, tjs: Aed?
    let jmd, gbp, shp, awg: Aed?
    let pkr, byn, sbd, szl: Aed?
    let zar, xpf, mxn, ggp: Aed?
    let chf, bwp, ils, gnf: Aed?
    let kpw, php, tnd, xaf: Aed?
    let ngn, jep, egp, jod: Aed?
    let kmf, lsl, idr, cad: Aed?
    let amd, fkp, pab, lak: Aed?
    let azn, khr, cuc, cup: Aed?
    let stn, rsd, vnd, lkr: Aed?
    let mad, mru, qar, sll: Aed?
    let isk, gmd, gyd, ang: Aed?
    let sek, tvd, aed, ves: Aed?
    let wst, lbp, top, imp: Aed?
    let bam: BAM?
    let htg, scr, tzs, dkk: Aed?
    let fok, ern, etb, mnt: Aed?
    let npr, syp, bnd, sgd: Aed?
    let ssp, iqd, all, ugx: Aed?
    let btn, inr, nad, omr: Aed?
    let bdt, djf, twd, mur: Aed?
    let nok, thb, hnl, pyg: Aed?
    let lrd, sos, gip, bsd: Aed?
    let mwk, sar, lyd, bob: Aed?
    let pgk, bbd, bgn: Aed?
    let sdg: BAM?
    let tmt, mmk, brl, cop: Aed?
    let irr, mdl, mop, cve: Aed?
    let jpy, bhd, ckd, mvr: Aed?
    let dop, cdf, yer, uah: Aed?
    let cny, pen, srd, afn: Aed?
    let huf, kwd, kyd, myr: Aed?
    let ghs, hrk, czk, uzs: Aed?
    let bif, bzd, kes, kzt: Aed?
    let ars, hkd, ron, kid: Aed?
    let vuv, aoa, pln, mzn: Aed?
    let bmd, rub: Aed?

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
        case gtq = "GTQ"
        case clp = "CLP"
        case uyu = "UYU"
        case kgs = "KGS"
        case zmw = "ZMW"
        case nzd = "NZD"
        case gel = "GEL"
        case ttd = "TTD"
        case krw = "KRW"
        case usd = "USD"
        case xof = "XOF"
        case mkd = "MKD"
        case fjd = "FJD"
        case mga = "MGA"
        case xcd = "XCD"
        case aud = "AUD"
        case crc = "CRC"
        case dzd = "DZD"
        case nio = "NIO"
        case zwl = "ZWL"
        case rwf = "RWF"
        case currenciesTRY = "TRY"
        case tjs = "TJS"
        case jmd = "JMD"
        case gbp = "GBP"
        case shp = "SHP"
        case awg = "AWG"
        case pkr = "PKR"
        case byn = "BYN"
        case sbd = "SBD"
        case szl = "SZL"
        case zar = "ZAR"
        case xpf = "XPF"
        case mxn = "MXN"
        case ggp = "GGP"
        case chf = "CHF"
        case bwp = "BWP"
        case ils = "ILS"
        case gnf = "GNF"
        case kpw = "KPW"
        case php = "PHP"
        case tnd = "TND"
        case xaf = "XAF"
        case ngn = "NGN"
        case jep = "JEP"
        case egp = "EGP"
        case jod = "JOD"
        case kmf = "KMF"
        case lsl = "LSL"
        case idr = "IDR"
        case cad = "CAD"
        case amd = "AMD"
        case fkp = "FKP"
        case pab = "PAB"
        case lak = "LAK"
        case azn = "AZN"
        case khr = "KHR"
        case cuc = "CUC"
        case cup = "CUP"
        case stn = "STN"
        case rsd = "RSD"
        case vnd = "VND"
        case lkr = "LKR"
        case mad = "MAD"
        case mru = "MRU"
        case qar = "QAR"
        case sll = "SLL"
        case isk = "ISK"
        case gmd = "GMD"
        case gyd = "GYD"
        case ang = "ANG"
        case sek = "SEK"
        case tvd = "TVD"
        case aed = "AED"
        case ves = "VES"
        case wst = "WST"
        case lbp = "LBP"
        case top = "TOP"
        case imp = "IMP"
        case bam = "BAM"
        case htg = "HTG"
        case scr = "SCR"
        case tzs = "TZS"
        case dkk = "DKK"
        case fok = "FOK"
        case ern = "ERN"
        case etb = "ETB"
        case mnt = "MNT"
        case npr = "NPR"
        case syp = "SYP"
        case bnd = "BND"
        case sgd = "SGD"
        case ssp = "SSP"
        case iqd = "IQD"
        case all = "ALL"
        case ugx = "UGX"
        case btn = "BTN"
        case inr = "INR"
        case nad = "NAD"
        case omr = "OMR"
        case bdt = "BDT"
        case djf = "DJF"
        case twd = "TWD"
        case mur = "MUR"
        case nok = "NOK"
        case thb = "THB"
        case hnl = "HNL"
        case pyg = "PYG"
        case lrd = "LRD"
        case sos = "SOS"
        case gip = "GIP"
        case bsd = "BSD"
        case mwk = "MWK"
        case sar = "SAR"
        case lyd = "LYD"
        case bob = "BOB"
        case pgk = "PGK"
        case bbd = "BBD"
        case bgn = "BGN"
        case sdg = "SDG"
        case tmt = "TMT"
        case mmk = "MMK"
        case brl = "BRL"
        case cop = "COP"
        case irr = "IRR"
        case mdl = "MDL"
        case mop = "MOP"
        case cve = "CVE"
        case jpy = "JPY"
        case bhd = "BHD"
        case ckd = "CKD"
        case mvr = "MVR"
        case dop = "DOP"
        case cdf = "CDF"
        case yer = "YER"
        case uah = "UAH"
        case cny = "CNY"
        case pen = "PEN"
        case srd = "SRD"
        case afn = "AFN"
        case huf = "HUF"
        case kwd = "KWD"
        case kyd = "KYD"
        case myr = "MYR"
        case ghs = "GHS"
        case hrk = "HRK"
        case czk = "CZK"
        case uzs = "UZS"
        case bif = "BIF"
        case bzd = "BZD"
        case kes = "KES"
        case kzt = "KZT"
        case ars = "ARS"
        case hkd = "HKD"
        case ron = "RON"
        case kid = "KID"
        case vuv = "VUV"
        case aoa = "AOA"
        case pln = "PLN"
        case mzn = "MZN"
        case bmd = "BMD"
        case rub = "RUB"
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String
}

// MARK: - BAM
struct BAM: Codable {
    let name: String
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let unclearF, unclearM: String
    enum CodingKeys: String, CodingKey {
        case unclearF = "f"
        case unclearM = "m"
    }
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format: String
    let regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday
    case sunday
    case turday
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}

extension Country: Comparable {
    static func < (lhs: Country, rhs: Country) -> Bool {
        lhs.name.common < rhs.name.common
    }

    static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.name.common == rhs.name.common
    }
}
