//
//  StringExtension.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation
import UIKit

public extension String {
    
    func toDateString(oldFormat: String, newFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = oldFormat
        if let newDate = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = newFormat
            return dateFormatter.string(from: newDate)
        }
        return "-"
    }
}
