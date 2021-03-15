//
//  ApiClient.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation

protocol ApiClientProtocol: NSObject {
    func get<T: Decodable>(path: String, success: @escaping ([T]) -> (), failure: @escaping (Error) -> ())
    func getBy<T: Decodable>(path: String, id: Int, success: @escaping (T) -> (), failure: @escaping (Error) -> ())
    
    func post() // TODO
    func put() // TODO
    func delete() // TODO
}

class ApiClient: NSObject, ApiClientProtocol {
    
    private enum Constants {
        static let apiKeyName: String = "X-CMC_PRO_API_KEY"
        static let baseUrl: String = "https://pro-api.coinmarketcap.com/v1"
        static let apiKey: String = "1fee9092-8645-4455-88bc-98a033baee09"
    }
    
    override init() {
        // Configure api client
        
    }
    
    func get<T>(path: String, success: @escaping ([T]) -> (), failure: @escaping (Error) -> ()) where T : Decodable {
        
    }
    
    func getBy<T>(path: String, id: Int, success: @escaping (T) -> (), failure: @escaping (Error) -> ()) where T : Decodable {
        
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
