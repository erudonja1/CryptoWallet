//
//  CoinLocalDataSource.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

// simulation of caching in database
var databaseCoins: [CoinDetailsDbModel] = []

class CoinDetailsLocalDataSource: CoinDetailsLocalDataSourceProtocol {
    private let mapper: CoinDetailsDataMapper
    
    init(mapper: CoinDetailsDataMapper = CoinDetailsDataMapper()) {
        self.mapper = mapper
    }
    
    func getAll() -> [CoinDetailsDataModel] {
        mapper.fromDb(dbModels: databaseCoins)
    }
    
    func updateAll(data: [CoinDetailsDataModel]) {
        databaseCoins = mapper.toDb(dataModels: data)
    }
    
    func getDetails(id: Int) -> CoinDetailsDataModel? {
        if let coinDb = databaseCoins.first(where: {$0.id == id}) {
            let coinDetails = mapper.fromDb(dbModel: coinDb)
            return coinDetails
        }
        
        return nil
    }
    
    func updateDetails(data: CoinDetailsDataModel) {
        if let index = databaseCoins.firstIndex(where: {$0.id == data.id}) {
            let coinDb = mapper.toDb(dataModel: data)
            databaseCoins[index] = coinDb
        }
    }
}
