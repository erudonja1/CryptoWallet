//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation

class HomeViewModel: NSObject, HomeViewModelProtocol {
    
    var dataLoaded: () -> Void = {}
    var detailsLoaded: (Int) -> Void = {_ in }
    var showError: (Error) -> Void = {_ in }
    
    private var useCase: CoinDetailsUseCaseProtocol
    private var data: [CoinUIModel] = []
    private var mapper: CoinUIMapper
    private var title: String = "Top 100 coins"
    
    init(useCase: CoinDetailsUseCaseProtocol,
         mapper: CoinUIMapper = CoinUIMapper()) {
        self.useCase = useCase
        self.mapper = mapper
    }
    
    func fetchData() {
        useCase.fetchAll(success: {[weak self] presentationResults in
            guard let self = self else { return }
            let uiResults = self.mapper.fromPresentation(presentationModels: presentationResults)
            self.data = uiResults
            self.dataLoaded()
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.showError(error)
        })
    }
    
    func getData() -> [CoinUIModel] {
        data
    }
    
    func getTitle() -> String {
        title
    }
    
    func fetchDetails(for id: Int) {
        useCase.fetchSmallerDetails(id: id, success: {[weak self] presentationResult in
            guard let self = self else { return }
            let uiResult = self.mapper.fromPresentation(presentationModel: presentationResult)
            if let index = self.data.firstIndex(where: {$0.id == id}) {
                self.data[index] = uiResult
                self.detailsLoaded(id)
            }
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.showError(error)
        })
    }
    
    func getDetails(by index: Int) -> CoinUIModel {
        data[index]
    }
    
    func getIndex(by id: Int) -> Int? {
        data.firstIndex(where: { $0.id == id})
    }
}
