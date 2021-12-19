//
//  UIAlertController+Extension.swift
//  IMDBList
//
//  Created by Hernán Villamil on 19/12/21.
//

import UIKit

extension UIAlertController {
    public enum alertType {
        case searchFail
        case datailLoadFail
    }
    
    static func getAlertForType(_ type: alertType, refreshAction: (() -> Void)? = nil) -> UIAlertController {
        switch type {
        case .searchFail:
            return getFetchFailAlert(refreshAction: refreshAction)
        case .datailLoadFail:
            return getFetchFailAlert(refreshAction: refreshAction)
        }
    }
    
    private static func getFetchFailAlert(refreshAction: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: "Ups...", message: "Coldn't load the data right now.\nPlase try again.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        if refreshAction != nil {
            let refresh = UIAlertAction(title: "Try again", style: .default) { (alert) in
                refreshAction?()
            }
            alert.addAction(refresh)
        }
        return alert
    }
}
