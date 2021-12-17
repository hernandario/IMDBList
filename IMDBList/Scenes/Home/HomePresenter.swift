//
//  HomePresenter.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

protocol HomePrensenter: AnyObject {
    
}

class HomePresenterimplementation {
    let view: HomeView
    let interactor: HomeInteractor
    let router: HomeRouter
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenterimplementation: HomePrensenter {
    
}
