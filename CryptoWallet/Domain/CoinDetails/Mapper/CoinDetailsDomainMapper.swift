//
//  CoinDetailsDomainMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinDetailsDomainMapper {
    func fromData(dataModel: CoinDetailsDataModel) -> CoinDetailsDomainModel {
        CoinDetailsDomainModel(id: dataModel.id, name: dataModel.name)
    }
    
    func fromData(dataModels: [CoinDetailsDataModel]) -> [CoinDetailsDomainModel] {
        var result: [CoinDetailsDomainModel] = []
        for dataModel in dataModels {
            result.append(fromData(dataModel: dataModel))
        }
        return result
    }
    
}
