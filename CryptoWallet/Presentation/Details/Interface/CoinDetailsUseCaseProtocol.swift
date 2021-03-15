//
//  CoinUseCaseProtocol.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

protocol CoinDetailsUseCaseProtocol {
    func fetchAll(success: @escaping ([CoinPresentationModel]) -> (), failure: @escaping (Error) -> ())
    func fetchDetails(id: Int, success: @escaping (CoinDetailsPresentationModel) -> (), failure: @escaping (Error) -> ())
    func fetchSmallerDetails(id: Int, success: @escaping (CoinPresentationModel) -> (), failure: @escaping (Error) -> ())
}

