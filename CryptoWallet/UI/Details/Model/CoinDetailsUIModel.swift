//
//  CoinDetailsUIModel.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

struct CoinDetailsUIModel {
    let id: Int
    let name: String
    let ticker: String
    let price: Float
    let percentChange24h: Float
    var volume24h: Float?
    var marketCap: Float?
    var circulatingSupply: Float?
    var logo: String?
}
