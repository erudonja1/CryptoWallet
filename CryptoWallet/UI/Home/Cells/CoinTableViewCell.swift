//
//  CoinTableViewCell.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinTickerLabel: UILabel!
    @IBOutlet weak var coinPercentageLabel: UILabel!
    @IBOutlet weak var coinCurrentPriceLabel: UILabel!
    
    func setup(model: CoinUIModel) {
        
        if let logo = model.logo {
            coinImageView.imageFromUrl(urlString: logo)
        } else {
            coinImageView.image = UIImage(named: "loading")
        }
        
        coinNameLabel.text = model.name
        coinTickerLabel.text = model.ticker
        
        if model.percentChange24h > 0 {
            coinPercentageLabel.textColor = .green
        } else {
            coinPercentageLabel.textColor = .red
        }
        let percentage = floor((model.percentChange24h) * 100) / 100
        coinPercentageLabel.text = "\(percentage)%"
        
        let price = floor((model.price) * 100) / 100
        coinCurrentPriceLabel.text = "\(price)$"
        
        selectionStyle = .none
    }
}
