//
//  MessagePresenting.swift
//  NWMuseumAR
//
//  Created by Kerry Regan on 2018-02-28.
//  Copyright © 2018 NWMuseumAR. All rights reserved.
//
import UIKit

protocol MessagePresenting {
    func presentMessage(title: String, message: String)
}

extension MessagePresenting where Self: UIViewController {
    func presentMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}

