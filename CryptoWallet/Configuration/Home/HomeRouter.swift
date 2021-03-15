//
//  HomeNavigation.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import Foundation
import UIKit

class HomeRouter: NSObject {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToDetails(model: CoinUIModel) {
        let detailsVc = DetailsViewController()
        detailsVc.viewModel = DetailsDI().createViewModel(coin: model)
        navigationController.pushViewController(detailsVc, animated: true)
    }
}
