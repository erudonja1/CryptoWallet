//
//  DetailsViewModelDelegate.swift
//  CryptoWallet
//
//  Created by Elvis on 3/15/21.
//

import Foundation
protocol DetailsViewModelProtocol: NSObject {
    func fetchDetails()
    func getDetails() -> CoinDetailsUIModel
    func getTitle() -> String
    
    var detailsLoaded: () -> Void  { get set }
    var showError: (Error) -> Void  { get set }
}
