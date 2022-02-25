//
//  ResponseModel.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation

struct ResponseModel: Decodable {
    let resultCount: Int?
    let results: [SearchModel]?
}
