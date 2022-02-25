//
//  FinansNavigationItem.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation
import UIKit

class FinansNavigationItem: UINavigationItem {
    @IBInspectable var localizableKey: String? = nil {
        didSet {
            if localizableKey != nil {
                self.title = NSLocalizedString(localizableKey!, comment: "")
            }
        }
    }
}
