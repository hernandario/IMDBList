//
//  HomeRouter.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

protocol HomeRouter: AnyObject {
    
}

class HomeRouterImplementation {
    private let controller: HomeViewController
    
    init(controller: HomeViewController) {
        self.controller = controller
    }
}

extension HomeRouterImplementation: HomeRouter {
    
}
