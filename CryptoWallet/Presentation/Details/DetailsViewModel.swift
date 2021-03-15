//
//  DetailsViewModel.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//
import Foundation

class DetailsViewModel: NSObject, DetailsViewModelProtocol {
    var detailsLoaded: () -> Void = {}
    var showError: (Error) -> Void = {_ in }
   
    private var useCase: CoinDetailsUseCaseProtocol
    private var data: CoinDetailsUIModel
    private var mapper: CoinDetailsUIMapper
    private var title: String
    
    init(data: CoinDetailsUIModel,
        useCase: CoinDetailsUseCaseProtocol,
        mapper: CoinDetailsUIMapper = CoinDetailsUIMapper()) {
        self.useCase = useCase
        self.mapper = mapper
        self.data = data
        self.title = self.data.name
    }
    
    func getData() -> CoinDetailsUIModel {
        data
    }
    
    func getTitle() -> String {
        title
    }
    
    func fetchDetails() {
        useCase.fetchDetails(id: data.id, success: {[weak self] presentationResult in
            guard let self = self else { return }
            let uiResult = self.mapper.fromPresentation(presentationModel: presentationResult)
            self.data = uiResult
            self.detailsLoaded()
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.showError(error)
        })
    }
    
    func getDetails() -> CoinDetailsUIModel {
        data
    }
}
