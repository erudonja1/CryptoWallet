//
//  ApiClient.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation
import Alamofire

protocol ApiClientProtocol: NSObject {
    func get<T: Decodable>(path: String, parameters: [String: Any], success: @escaping ([T]) -> (), failure: @escaping (Error) -> ())
    func get<T: Decodable>(path: String, parameters: [String: Any], success: @escaping (T) -> (), failure: @escaping (Error) -> ())
    
    func post() // TODO
    func put() // TODO
    func delete() // TODO
}

class ApiClient: NSObject, ApiClientProtocol {
    
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var baseHeaders: HTTPHeaders = [
        Constants.apiKeyName: Constants.apiKey,
        "Accept": "application/json"
    ]
    
    private enum Constants {
        static let apiKeyName: String = "X-CMC_PRO_API_KEY"
        static let baseUrl: String = "https://pro-api.coinmarketcap.com/v1"
        static let apiKey: String = "1fee9092-8645-4455-88bc-98a033baee09"
    }

    func get<T>(path: String, parameters: [String: Any], success: @escaping ([T]) -> (), failure: @escaping (Error) -> ()) where T : Decodable {
        let url = baseURL.appendingPathComponent(path)

        AF.request(url, parameters: parameters, headers: baseHeaders).responseDecodable(of: [T].self) { response in
            if let responseValue = response.value {
                success(responseValue)
            } else {
                failure(response.error ?? NSError(domain: "Data source", code: 0, userInfo: nil))
            }
        }
    }
    
    func get<T>(path: String, parameters: [String: Any], success: @escaping (T) -> (), failure: @escaping (Error) -> ()) where T : Decodable {
        let url = baseURL.appendingPathComponent(path)
        
        AF.request(url, parameters: parameters, headers: baseHeaders).responseDecodable(of: T.self) { response in
            if let responseValue = response.value {
                success(responseValue)
            } else {
                failure(response.error ?? NSError(domain: "Data source", code: 0, userInfo: nil))
            }
        }
    }
    
    func post() {
        // TODO
    }
    
    func put() {
        // TODO
    }
    
    func delete() {
        // TODO
    }
    
}
