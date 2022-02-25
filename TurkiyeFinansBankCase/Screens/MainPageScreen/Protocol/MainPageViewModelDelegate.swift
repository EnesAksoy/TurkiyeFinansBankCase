//
//  MainPageViewModelDelegate.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation

protocol MainPageViewModelDelegate {
    
    func updateView(_ searchModel: [SearchModel], errorText: String)
}
