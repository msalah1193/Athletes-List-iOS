//
//  UIViewController+Extension.swift
//  Athletics-List-iOS
//
//  Created by Mohamed Salah on 9/12/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

protocol AlertsDelegate {
    func showAlert()
    func hideAlert()
    func showErrorAlert(message: String)
}

extension UIViewController: AlertsDelegate{
    func showAlert() {
        ALLoadingView.manager.showLoadingView(ofType: .basic, windowMode: .fullscreen)
    }
    
    func hideAlert() {
        ALLoadingView.manager.hideLoadingView(withDelay: 0.0)
    }
    
    func showErrorAlert(message: String) {
        _ = SweetAlert().showAlert("ERROR",
                                   subTitle: message,
                                   style: AlertStyle.error,
                                   buttonTitle: "OK")
    }
}
