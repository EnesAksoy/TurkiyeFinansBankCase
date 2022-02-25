//
//  MainPageViewModel.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation

class MainPageViewModel: NSObject {
    
    // MARK: - Delegate
    
    var delegate: MainPageViewModelDelegate?
    
    // MARK: - Properties
    
    private var apiService: APIService!
    private var searchModel: [SearchModel] = []
    private var filterSearchModel: [SearchModel] = []
    
    override init() {
        super.init()
        self.apiService = APIService()
    }
    
    func serviceCallMethod(search: String) {
        let searchText = search.replacingOccurrences(of: " ", with: "+")
        apiService.apiToGetEmployeeData(search: searchText) {[weak self] (searchModel, error)  in
            self?.searchModel = searchModel
            self?.delegate?.updateView(searchModel, errorText: error)
        }
    }
    
    func filterSearchModel(wrapperType: WrapperType) {
        self.filterSearchModel.removeAll()
        if self.searchModel.count != 0 {
            for search in self.searchModel {
                search.wrapperType == WrapperType(rawValue: wrapperType.rawValue)?.rawValue ?? "" ? filterSearchModel.append(search) : print(search.wrapperType)
                self.delegate?.updateView(self.filterSearchModel, errorText: "")
            }
        }
    }
}

