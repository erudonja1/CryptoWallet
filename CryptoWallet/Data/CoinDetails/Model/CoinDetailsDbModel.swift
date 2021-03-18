//
//  CoinDetailsDbModel.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation

struct CoinDetailsDbModel {
    let id: Int
    let name: String
    let ticker: String
    let price: Float
    let percentChange24h: Float
    let volume24h: Float
    let marketCap: Float
    let circulatingSupply: Float
    var logo: String?
}
