//
//  CoinUIMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinUIMapper {
    func fromPresentation(presentationModel: CoinPresentationModel) -> CoinUIModel {
        CoinUIModel(id: presentationModel.id, name: presentationModel.name)
    }
    
    func fromPresentation(presentationModels: [CoinPresentationModel]) -> [CoinUIModel] {
        var result: [CoinUIModel] = []
        for presentationModel in presentationModels {
            result.append(fromPresentation(presentationModel: presentationModel))
        }
        return result
    }
}
