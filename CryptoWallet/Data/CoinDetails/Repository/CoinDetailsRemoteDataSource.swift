//
//  CoinDetailsRemoteDataSource.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinDetailsRemoteDataSource: CoinDetailsRemoteDataSourceProtocol {
    private let mapper: CoinDetailsDataMapper
    private let apiClient: ApiClient
    
    init(mapper: CoinDetailsDataMapper = CoinDetailsDataMapper(), apiClient: ApiClient = ApiClient()) {
        self.mapper = mapper
        self.apiClient = apiClient
    }
    
    func fetchAll(success: @escaping ([CoinDetailsDataModel]) -> (), failure: @escaping (Error) -> ()) {
        let path = "cryptocurrency/listings/latest"
        let parameters = [
            "start": 1,
            "limit": 100
        ]
        
        apiClient.get(path: path, parameters: parameters, success: { [weak self] (coins: CoinsApiResponse) in
            guard let self = self else { return }
            let dataModels = self.mapper.fromApi(apiModels: coins.data)
            success(dataModels)
        }, failure: failure)
    }
    
    func fetchDetails(id: Int, success: @escaping (CoinDetailsDataModel) -> (), failure: @escaping (Error) -> ()) {
        let path = "cryptocurrency/info"
        let parameters = [
            "id": id
        ]
        
        apiClient.get(path: path, parameters: parameters, success: { [weak self] (coin: CoinApiResponse) in
            guard let self = self else { return }
            let dataModel = self.mapper.fromApi(id: id, apiModel: coin.data)
            success(dataModel)
        }, failure: failure)
    }
}
