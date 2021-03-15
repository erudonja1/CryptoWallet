//
//  CoinDetailsDataMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinDetailsDataMapper {
    func fromApi(apiModel: CoinDetailsApiModel) -> CoinDetailsDataModel {
        CoinDetailsDataModel(id: apiModel.id, name: apiModel.name)
    }
    
    func fromApi(apiModels: [CoinDetailsApiModel]) -> [CoinDetailsDataModel] {
        var result: [CoinDetailsDataModel] = []
        for apiModel in apiModels {
            result.append(fromApi(apiModel: apiModel))
        }
        return result
    }
    
    func fromDb(dbModel: CoinDetailsDbModel) -> CoinDetailsDataModel {
        CoinDetailsDataModel(id: dbModel.id, name: dbModel.name)
    }
    
    func fromDb(dbModels: [CoinDetailsDbModel]) -> [CoinDetailsDataModel] {
        var result: [CoinDetailsDataModel] = []
        for dbModel in dbModels {
            result.append(fromDb(dbModel: dbModel))
        }
        return result
    }
    
    func toDb(dataModel: CoinDetailsDataModel) -> CoinDetailsDbModel {
        CoinDetailsDbModel(id: dataModel.id, name: dataModel.name, logo: dataModel.logo)
    }
    
    func toDb(dataModels: [CoinDetailsDataModel]) -> [CoinDetailsDbModel] {
        var result: [CoinDetailsDbModel] = []
        for dataModel in dataModels {
            result.append(toDb(dataModel: dataModel))
        }
        return result
    }
}
