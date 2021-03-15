//
//  CoinDetailsRemoteDataSource.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinDetailsRemoteDataSource: CoinDetailsRemoteDataSourceProtocol {
    private let mapper: CoinDetailsDataMapper
    
    init(mapper: CoinDetailsDataMapper = CoinDetailsDataMapper()) {
        self.mapper = mapper
    }
    
    func fetchAll(success: @escaping ([CoinDetailsDataModel]) -> (), failure: @escaping (Error) -> ()) {
        
    }
    
    func fetchDetails(id: Int, success: @escaping (CoinDetailsDataModel) -> (), failure: @escaping (Error) -> ()) {
        
    }
}
