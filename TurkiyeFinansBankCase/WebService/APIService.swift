//
//  APIService.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import Foundation

class APIService :  NSObject {
    
    private let baseUrlString = "https://itunes.apple.com/search"
    private let baseUrl = URL(string: "https://itunes.apple.com/search")!
    private let searchModel: [SearchModel] = []
    
    func apiToGetEmployeeData(search: String ,completion : @escaping ([SearchModel], _ error: String) -> ()) {
        let apiUrl = "\(baseUrlString)?term=\(search)"
        
        URLSession.shared.dataTask(with: (URL(string: apiUrl)) ?? baseUrl,
                                   completionHandler: { [weak self] data, response, error in
                                    
                                    guard let data = data, let self = self, error == nil else { return }
                                    
                                    // Convert
                                    var result: ResponseModel?
                                    do {
                                        result = try JSONDecoder().decode(ResponseModel.self, from: data)
                                    }
                                    catch {
                                        completion(self.searchModel, error.localizedDescription)
                                    }
                                    
                                    guard let finalResult = result else { return }
                                    
                                    // Update our movies array
                                    let newMovies = finalResult.results
                                    completion(newMovies ?? [], error?.localizedDescription ?? "")
                                   }).resume()
    }
}

