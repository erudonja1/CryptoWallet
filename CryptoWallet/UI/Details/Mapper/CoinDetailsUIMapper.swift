//
//  CoinDetailsUIMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation

class CoinDetailsUIMapper {
    func fromPresentation(presentationModel: CoinDetailsPresentationModel) -> CoinDetailsUIModel {
        CoinDetailsUIModel(id: presentationModel.id,
                           name: presentationModel.name,
                           ticker: presentationModel.ticker,
                           price: presentationModel.price,
                           percentChange24h: presentationModel.percentChange24h,
                           volume24h: presentationModel.volume24h,
                           marketCap: presentationModel.marketCap,
                           circulatingSupply: presentationModel.circulatingSupply,
                           logo: presentationModel.logo)
    }
    
    func fromShorterDetails(coin: CoinUIModel) -> CoinDetailsUIModel {
        CoinDetailsUIModel(id: coin.id,
                           name: coin.name,
                           ticker: coin.ticker,
                           price: coin.price,
                           percentChange24h: coin.percentChange24h,
                           volume24h: nil,
                           marketCap: nil,
                           circulatingSupply: nil,
                           logo: coin.logo)
    }
}
