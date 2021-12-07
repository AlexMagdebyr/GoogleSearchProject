//
//  DataFetcherService.swift
//  GoogleSearch
//
//  Created by Алексей on 03.12.2021.
//

import Foundation

final class SearchRequests {
    private let networkDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    func searchRequestWith(search: String, completion: @escaping (SearchResponse?, String?) -> Void, progress: @escaping (Float) -> Void) {
        let url = "https://www.googleapis.com/customsearch/v1"
        
        let params: [String : String] = ["q" : search,
                                         "cx" : "91e8368cfd5cc8e9f",
                                         "key" : "AIzaSyDcTtyGGpU46Sej-5P1DjYDXzuAjnYPcm8"
        ]
        
        networkDataFetcher.genericJSONDataWith(type: .GET, urlString: url, parameters: params,
                                               response: completion, progress: progress)
    }
}
