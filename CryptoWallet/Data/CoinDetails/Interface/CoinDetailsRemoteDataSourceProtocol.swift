//
//  CoinDetailsRemoteDataSourceProtocol.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation

protocol CoinDetailsRemoteDataSourceProtocol {
    func fetchAll(success: @escaping ([CoinDetailsDataModel]) -> (), failure: @escaping (Error) -> ())
    func fetchDetails(id: Int, success: @escaping (CoinDetailsDataModel) -> (), failure: @escaping (Error) -> ())
}
