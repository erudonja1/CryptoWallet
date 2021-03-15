//
//  CoinDetailsPresentationMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation

class CoinDetailsPresentationMapper {
    func fromDomain(domainModel: CoinDetailsDomainModel) -> CoinDetailsPresentationModel {
        CoinDetailsPresentationModel(id: domainModel.id, name: domainModel.name)
    }
    
    func fromDomain(domainModels: [CoinDetailsDomainModel]) -> [CoinDetailsPresentationModel] {
        var result: [CoinDetailsPresentationModel] = []
        for domainModel in domainModels {
            result.append(fromDomain(domainModel: domainModel))
        }
        return result
    }
}
