//
//  HomeViewModelProtocol.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation
protocol HomeViewModelProtocol: NSObject {
    func fetchData()
    func getData() -> [CoinUIModel]
    func fetchDetails(for id: Int)
    func getDetails(by index: Int) -> CoinUIModel
    func getIndex(by id: Int) -> Int?
    func getTitle() -> String
    
    var dataLoaded: () -> Void { get set }
    var detailsLoaded: (Int) -> Void { get set }
    var showError: (Error) -> Void { get set }
}
