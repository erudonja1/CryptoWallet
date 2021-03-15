//
//  DetailsViewController.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import UIKit

class DetailsViewController: UIViewController {
    var viewModel: DetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupView()
        title = viewModel?.getTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.fetchDetails()
    }
    
    private func setupView() {
        // set values from fields
    }
    
    private func setupViewModel() {
        viewModel?.detailsLoaded = { [weak self] in
            guard let self = self else {return}
            self.setupView()
        }
        
        viewModel?.showError = { [weak self] error in
            guard let self = self else {return}
            // not implemented yet
        }
    }
}
