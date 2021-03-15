//
//  CoinDetailsUIMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation

class CoinDetailsUIMapper {
    func fromPresentation(presentationModel: CoinDetailsPresentationModel) -> CoinDetailsUIModel {
        CoinDetailsUIModel(id: presentationModel.id, name: presentationModel.name)
    }
    
    func fromShorterDetails(coin: CoinUIModel) -> CoinDetailsUIModel {
        CoinDetailsUIModel(id: coin.id, name: coin.name)
    }
}
