//
//  CoinDetailsApiModel.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

struct CoinDetailsApiModel: Decodable {
    let id: Int
    let name: String
    let symbol: String
    let quote: CoinDetailsQuouteApiModel
    let circulating_supply: Float
    let logo: String?
    
    struct CoinDetailsQuouteApiModel: Decodable {
        let USD: CoinDetailsQuoteValueApiModel
    }
    
    struct CoinDetailsQuoteValueApiModel: Decodable {
        let price: Float
        let percent_change_24h: Float
        let volume_24h: Float
        let market_cap: Float
    }
}

struct CoinApiResponse: Decodable {
    let data: [String: CoinDetailsApiModel]
}

struct CoinsApiResponse: Decodable {
    let data: [CoinDetailsApiModel]
}
