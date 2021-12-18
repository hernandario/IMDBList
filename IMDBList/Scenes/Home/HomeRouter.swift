//
//  HomeRouter.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

protocol HomeRouter: AnyObject {
    func goToDetailWithIdentifier(_ identifier: String)
}

class HomeRouterImplementation {
    private let controller: HomeViewController
    
    init(controller: HomeViewController) {
        self.controller = controller
    }
}

extension HomeRouterImplementation: HomeRouter {
    func goToDetailWithIdentifier(_ identifier: String) {
        guard let detailController = DetailRouterImplmentation.createSceneWithIdentifier(identifier) else { return }
        controller.navigationController?.pushViewController(detailController, animated: true)
    }
}
