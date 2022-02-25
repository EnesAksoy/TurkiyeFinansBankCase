//
//  SearchModel.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation

struct SearchModel: Decodable {
    let artworkUrl100: String?
    let collectionPrice: Double?
    let collectionName: String?
    let releaseDate: String?
    let wrapperType: String
}
