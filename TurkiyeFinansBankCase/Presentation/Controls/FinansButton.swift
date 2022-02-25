//
//  FinansButton.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation
import UIKit

class FinansButton: UIButton {
    @IBInspectable var localizableKey: String? = nil {
        didSet {
            if localizableKey != nil {
                self.setTitle(NSLocalizedString(localizableKey!, comment: ""), for: .normal)
                self.setTitleColor(.black, for: .normal)
                self.layer.cornerRadius = 5
            }
        }
    }
}
