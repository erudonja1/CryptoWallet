//
//  CoinUseCase.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class CoinDetailsUseCase: CoinDetailsUseCaseProtocol {
    private var repository: CoinDetailsRepositoryProtocol
    private var coinMapper: CoinPresentationMapper
    private var coinDetailsMapper: CoinDetailsPresentationMapper
    
    init(repository: CoinDetailsRepositoryProtocol,
         coinMapper: CoinPresentationMapper = CoinPresentationMapper(),
         coinDetailsMapper: CoinDetailsPresentationMapper = CoinDetailsPresentationMapper()) {
        self.repository = repository
        self.coinMapper = coinMapper
        self.coinDetailsMapper = coinDetailsMapper
    }
    
    func fetchAll(success: @escaping ([CoinPresentationModel]) -> (), failure: @escaping (Error) -> ()) {
        repository.getAll(success: {[weak self] domainResults in
            guard let self = self else {return}
            let presentationResults = self.coinMapper.fromDomain(domainModels: domainResults)
            success(presentationResults)
        }, failure: failure)
    }
    
    func fetchDetails(id: Int, success: @escaping (CoinDetailsPresentationModel) -> (), failure: @escaping (Error) -> ()) {
        repository.get(id: id, success: {[weak self] domainResult in
            guard let self = self else {return}
            let presentationResult = self.coinDetailsMapper.fromDomain(domainModel: domainResult)
            success(presentationResult)
        }, failure: failure)
    }
    
    func fetchSmallerDetails(id: Int, success: @escaping (CoinPresentationModel) -> (), failure: @escaping (Error) -> ()) {
        repository.get(id: id, success: {[weak self] domainResult in
            guard let self = self else {return}
            let presentationResult = self.coinMapper.fromDomain(domainModel: domainResult)
            success(presentationResult)
        }, failure: failure)
    }
}
