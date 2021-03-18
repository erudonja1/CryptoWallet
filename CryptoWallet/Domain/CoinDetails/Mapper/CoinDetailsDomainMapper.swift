//
//  CoinDetailsDomainMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinDetailsDomainMapper {
    func fromData(dataModel: CoinDetailsDataModel) -> CoinDetailsDomainModel {
        CoinDetailsDomainModel(id: dataModel.id,
                               name: dataModel.name,
                               ticker: dataModel.ticker,
                               price: dataModel.price,
                               percentChange24h: dataModel.percentChange24h,
                               volume24h: dataModel.volume24h,
                               marketCap: dataModel.marketCap,
                               circulatingSupply: dataModel.circulatingSupply,
                               logo: dataModel.logo)
    }
    
    func fromData(dataModels: [CoinDetailsDataModel]) -> [CoinDetailsDomainModel] {
        var result: [CoinDetailsDomainModel] = []
        for dataModel in dataModels {
            result.append(fromData(dataModel: dataModel))
        }
        return result
    }
    
}
