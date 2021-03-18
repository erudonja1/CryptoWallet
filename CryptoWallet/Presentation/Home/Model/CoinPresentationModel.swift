//
//  CoinPresentationModel.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

struct CoinPresentationModel {
    let id: Int
    let name: String
    let ticker: String
    let price: Float
    let percentChange24h: Float
    var logo: String?
}
