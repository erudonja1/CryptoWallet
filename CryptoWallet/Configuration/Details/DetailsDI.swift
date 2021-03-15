//
//  DetailsDIContainer.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//
import Foundation

class DetailsDI: NSObject {
    func createLocalDataSource() -> CoinDetailsLocalDataSourceProtocol {
        CoinDetailsLocalDataSource()
    }
    
    func createRemoteDataSource() -> CoinDetailsRemoteDataSourceProtocol {
        CoinDetailsRemoteDataSource()
    }
    
    func createRepository() -> CoinDetailsRepositoryProtocol {
        let localDataSource = createLocalDataSource()
        let remoteDataSource = createRemoteDataSource()
        return CoinDetailsRepository(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
    }
    
    func createUseCase() -> CoinDetailsUseCaseProtocol {
        let useCase = CoinDetailsUseCase(repository: createRepository())
        return useCase
    }
    
    func createViewModel(coin: CoinUIModel) -> DetailsViewModelProtocol {
        let mapper = CoinDetailsUIMapper()
        let data = mapper.fromShorterDetails(coin: coin)
        let useCase = createUseCase()
        
        let viewModel = DetailsViewModel(data: data, useCase: useCase)
        return viewModel
    }
}
