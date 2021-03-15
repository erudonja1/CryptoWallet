//
//  HomeContainer.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class HomeDI: NSObject {
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
    
    func createViewModel() -> HomeViewModelProtocol {
        let useCase = createUseCase()
        let viewModel = HomeViewModel(useCase: useCase)
        return viewModel
    }
}
