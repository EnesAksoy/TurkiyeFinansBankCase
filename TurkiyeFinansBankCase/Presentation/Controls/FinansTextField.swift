//
//  FinansTextField.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation
import UIKit

class FinansTextField: UITextField {
    @IBInspectable var localizableKey: String? = nil {
        didSet {
            if localizableKey != nil {
                self.placeholder = NSLocalizedString(localizableKey!, comment: "")
            }
        }
    }
}
