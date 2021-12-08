//
//  UIAlertController+Ext.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/8/21.
//

import Foundation
import UIKit

extension UIAlertController {
    /// present alert with title and message
    /// - Parameters:
    ///   - title: String instance of title
    ///   - message: String instance of message
    ///   - presenter: UIViewController instance of presenter
    class func present(withTitle title: String,
                       withMessage message: String,
                       fromPresenter presenter: UIViewController) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel) { _ in
            alertController.dismiss(animated: true)
        }
        alertController.addAction(cancelAction)
        presenter.present(alertController,
                          animated: true,
                          completion: nil)
    }
}
