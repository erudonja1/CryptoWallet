//
//  CoinDetailsLocalDataSourceProtocol.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation

protocol CoinDetailsLocalDataSourceProtocol {
    func getAll() -> [CoinDetailsDataModel]
    func updateAll(data: [CoinDetailsDataModel])
    func getDetails(id: Int) -> CoinDetailsDataModel?
    func updateDetails(data: CoinDetailsDataModel)
}
