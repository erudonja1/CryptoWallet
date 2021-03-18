//
//  CoinDetailsPresentationMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation

class CoinDetailsPresentationMapper {
    func fromDomain(domainModel: CoinDetailsDomainModel) -> CoinDetailsPresentationModel {
        CoinDetailsPresentationModel(id: domainModel.id,
                                     name: domainModel.name,
                                     ticker: domainModel.ticker,
                                     price: domainModel.price,
                                     percentChange24h: domainModel.percentChange24h,
                                     volume24h: domainModel.volume24h,
                                     marketCap: domainModel.marketCap,
                                     circulatingSupply: domainModel.circulatingSupply,
                                     logo: domainModel.logo)
    }
    
    func fromDomain(domainModels: [CoinDetailsDomainModel]) -> [CoinDetailsPresentationModel] {
        var result: [CoinDetailsPresentationModel] = []
        for domainModel in domainModels {
            result.append(fromDomain(domainModel: domainModel))
        }
        return result
    }
}
