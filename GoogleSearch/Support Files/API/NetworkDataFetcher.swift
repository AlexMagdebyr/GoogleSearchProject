//
//  NetworkDataFetcher.swift
//  GoogleSearch
//
//  Created by Алексей on 03.12.2021.
//

import Foundation

protocol DataFetcher {
    func genericJSONDataWith<T: Decodable>(type: NetworkService.RequestType, urlString: String,
                                           parameters: [String : Any],
                                           response: @escaping (T?, String?) -> Void,
                                           progress: @escaping (Float) -> Void)
}

final class NetworkDataFetcher: DataFetcher {
    var networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func genericJSONDataWith<T: Decodable>(type: NetworkService.RequestType,
                                           urlString: String,
                                           parameters: [String : Any],
                                           response: @escaping (T?, String?) -> Void,
                                           progress: @escaping (Float) -> Void) {
       
        networking.request(type: type, urlString: urlString, parameters: parameters, completion: { data, resp, error in
            if let error = error {
                let errorString = "Connection error: \((error as NSError).code)\nError received requesting data: \(error.localizedDescription)"
                response(nil, errorString)
            }
            
            var decoded: T?
            DispatchQueue.background(background: {
                decoded = self.decodeJSON(type: T.self, from: data)
            }, completion: {
                response(decoded, nil)
            })
            
            
        }, progress: progress)
    }
        
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}

extension DispatchQueue {
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .userInitiated).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
}
