//
//  UIImageView.swift
//  CryptoWallet
//
//  Created by Elvis on 3/18/21.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(url: url as URL)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {
                (response: URLResponse!, data: Data!, error: Error!) -> Void in
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
