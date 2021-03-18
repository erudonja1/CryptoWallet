//
//  CoinDetailsDataMapper.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinDetailsDataMapper {
    func fromApi(id: Int, apiModel: [String: CoinDetailsApiModel]) -> CoinDetailsDataModel {
        let object: CoinDetailsApiModel = apiModel["\(id)"]!
        
        return CoinDetailsDataModel(id: object.id,
                                    name: object.name,
                                    ticker: object.symbol,
                                    price: object.quote.USD.price,
                                    percentChange24h: object.quote.USD.percent_change_24h,
                                    volume24h: object.quote.USD.volume_24h,
                                    marketCap: object.quote.USD.market_cap,
                                    circulatingSupply: object.circulating_supply,
                                    logo: object.logo)
    }
    
    func fromApi(apiModel: CoinDetailsApiModel) -> CoinDetailsDataModel {
        CoinDetailsDataModel(id: apiModel.id,
                             name: apiModel.name,
                             ticker: apiModel.symbol,
                             price: apiModel.quote.USD.price,
                             percentChange24h: apiModel.quote.USD.percent_change_24h,
                             volume24h: apiModel.quote.USD.volume_24h,
                             marketCap: apiModel.quote.USD.market_cap,
                             circulatingSupply: apiModel.circulating_supply,
                             logo: apiModel.logo)
    }
    
    func fromApi(apiModels: [CoinDetailsApiModel]) -> [CoinDetailsDataModel] {
        var result: [CoinDetailsDataModel] = []
        for apiModel in apiModels {
            result.append(fromApi(apiModel: apiModel))
        }
        return result
    }
    
    func fromDb(dbModel: CoinDetailsDbModel) -> CoinDetailsDataModel {
        CoinDetailsDataModel(id: dbModel.id,
                             name: dbModel.name,
                             ticker: dbModel.ticker,
                             price: dbModel.price,
                             percentChange24h: dbModel.percentChange24h,
                             volume24h: dbModel.volume24h,
                             marketCap: dbModel.marketCap,
                             circulatingSupply: dbModel.circulatingSupply,
                             logo: dbModel.logo)
    }
    
    func fromDb(dbModels: [CoinDetailsDbModel]) -> [CoinDetailsDataModel] {
        var result: [CoinDetailsDataModel] = []
        for dbModel in dbModels {
            result.append(fromDb(dbModel: dbModel))
        }
        return result
    }
    
    func toDb(dataModel: CoinDetailsDataModel) -> CoinDetailsDbModel {
        CoinDetailsDbModel(id: dataModel.id,
                           name: dataModel.name,
                           ticker: dataModel.ticker,
                           price: dataModel.price,
                           percentChange24h: dataModel.percentChange24h,
                           volume24h: dataModel.volume24h,
                           marketCap: dataModel.marketCap,
                           circulatingSupply: dataModel.circulatingSupply,
                           logo: dataModel.logo)
    }
    
    func toDb(dataModels: [CoinDetailsDataModel]) -> [CoinDetailsDbModel] {
        var result: [CoinDetailsDbModel] = []
        for dataModel in dataModels {
            result.append(toDb(dataModel: dataModel))
        }
        return result
    }
}
