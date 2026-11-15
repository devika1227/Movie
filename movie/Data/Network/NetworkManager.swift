//
//  Network.swift
//  movie
//
//  Created by Devika on 17/07/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    // API Call
    func fetchAPIResponse(urlString: String, method: HTTPMethod, header: [String:String], param: [String: Any]? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
        let url = URL(string: urlString)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US")
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = header

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            do {
                if let data {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    completion(.success(data))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
