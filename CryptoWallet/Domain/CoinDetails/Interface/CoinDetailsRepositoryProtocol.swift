//
//  CoinDetailsRepositoryProtocol.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

protocol CoinDetailsRepositoryProtocol {
    func getAll(success: @escaping ([CoinDetailsDomainModel]) -> (), failure: @escaping (Error) -> ())
    func get(id: Int, success: @escaping (CoinDetailsDomainModel) -> (), failure: @escaping (Error) -> ())
}
