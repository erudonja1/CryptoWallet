//
//  CoinUIMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinUIMapper {
    func fromPresentation(presentationModel: CoinPresentationModel) -> CoinUIModel {
        CoinUIModel(id: presentationModel.id,
                    name: presentationModel.name,
                    ticker: presentationModel.ticker,
                    price: presentationModel.price,
                    percentChange24h: presentationModel.percentChange24h,
                    logo: presentationModel.logo)
    }
    
    func fromPresentation(presentationModels: [CoinPresentationModel]) -> [CoinUIModel] {
        var result: [CoinUIModel] = []
        for presentationModel in presentationModels {
            result.append(fromPresentation(presentationModel: presentationModel))
        }
        return result
    }
}
