//
//  APIManager.swift
//  RoversApp
//
//  Created by Tutku on 29.07.2021.
//

import Foundation

public class APIManager {
    
    public func sendRequest(_ url: String,completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string: url)!
        let urlRequest = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            completionHandler(data, response, error)
        }
        task.resume()
    }
    
    public func sendRequest<T: Decodable>(for: T.Type = T.self,
                                          url: String,completion: @escaping (Result<T>) -> Void) {
        return sendRequest(url) { data, response, error in
            guard let data = data else {
                return completion(.failure(error ?? NSError(domain: "SomeDomain", code: -1, userInfo: nil)))
            }
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    try completion(.success(decoder.decode(T.self, from: data)))
                } catch let decodingError {
                    completion(.failure(decodingError))
                }
            }
        }
    }
}

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}


