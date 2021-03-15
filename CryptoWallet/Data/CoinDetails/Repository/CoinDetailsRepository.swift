//
//  CoinDetailsRepository.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinDetailsRepository: CoinDetailsRepositoryProtocol {
    private let localDataSource: CoinDetailsLocalDataSourceProtocol
    private let remoteDataSource: CoinDetailsRemoteDataSourceProtocol
    private let mapper: CoinDetailsDomainMapper
    
    init(localDataSource: CoinDetailsLocalDataSourceProtocol,
         remoteDataSource: CoinDetailsRemoteDataSourceProtocol,
         mapper: CoinDetailsDomainMapper = CoinDetailsDomainMapper()) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }
    
    func getAll(success: @escaping ([CoinDetailsDomainModel]) -> (), failure: @escaping (Error) -> ()) {
        
        // if there are items in database, return them
        let localCoinData = localDataSource.getAll()
        if localCoinData.count > 0 {
            let domainResult = self.mapper.fromData(dataModels: localCoinData)
            success(domainResult)
            return
        }
        
        remoteDataSource.fetchAll(success: {[weak self] dataModels in
            guard let self = self else { return }
            let domainResult = self.mapper.fromData(dataModels: dataModels)
            success(domainResult)
        }, failure: failure)
    }
    
    func get(id: Int, success: @escaping (CoinDetailsDomainModel) -> (), failure: @escaping (Error) -> ()) {
        
        // if there is an item for given ID, with filled logo, return it
        if let localDetails = localDataSource.getDetails(id: id), let _ = localDetails.logo {
            let domainResult = self.mapper.fromData(dataModel: localDetails)
            success(domainResult)
            return
        }
        
        remoteDataSource.fetchDetails(id: id, success: {[weak self] dataResult in
            guard let self = self else { return }
            let domainResult = self.mapper.fromData(dataModel: dataResult)
            success(domainResult)
        }, failure: failure)
    }
}
