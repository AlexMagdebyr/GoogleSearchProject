//
//  NetworkService.swift
//  GoogleSearch
//
//  Created by Алексей on 03.12.2021.
//

import Foundation

protocol Networking {
    func request(type: NetworkService.RequestType, urlString: String, parameters: [String: Any],
                 completion: @escaping (Data?, URLResponse?, Error?) -> Void,
                 progress: @escaping (Float) -> Void)
}

final class NetworkService: Networking {
    enum RequestType: String {
        case POST
        case GET
        case PUT
        case DELETE
    }
    
    private var observation: NSKeyValueObservation?
    
    func request(type: RequestType, urlString: String, parameters: [String: Any],
                 completion: @escaping (Data?, URLResponse?, Error?) -> Void, progress: @escaping (Float) -> Void) {
        guard var components = URLComponents(string: urlString) else { return }
        components.queryItems = parameters.compactMap({ URLQueryItem(name: $0.key, value: $0.value as? String) })
        guard let url = components.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        
        let task = createDataTask(from: request, completion: completion)

        observation = task.progress.observe(\.fractionCompleted) { process, _ in
            DispatchQueue.main.async {
                progress(Float(process.fractionCompleted))
            }
        }
        
        task.resume()
    }
    
    private func createDataTask(from requst: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: requst, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        })
    }
    
    deinit {
      observation?.invalidate()
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}



