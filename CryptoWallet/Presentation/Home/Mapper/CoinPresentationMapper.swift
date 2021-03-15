//
//  CoinPresentationMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinPresentationMapper {
    func fromDomain(domainModel: CoinDetailsDomainModel) -> CoinPresentationModel {
        CoinPresentationModel(id: domainModel.id, name: domainModel.name)
    }
    
    func fromDomain(domainModels: [CoinDetailsDomainModel]) -> [CoinPresentationModel] {
        var result: [CoinPresentationModel] = []
        for domainModel in domainModels {
            result.append(fromDomain(domainModel: domainModel))
        }
        return result
    }
}
