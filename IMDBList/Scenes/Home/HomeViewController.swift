//
//  HomeViewController.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation
import UIKit

protocol HomeView: AnyObject {
    
}

class HomeViewController: UIViewController {
    var presenter: HomePrensenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        initScene()
        initUI()
    }
}


private extension HomeViewController {
    private func initScene() {
        let repository = IMDBSearchRepository()
        let interactor = HomeInteractorimplementation(repository: repository)
        let router = HomeRouterImplementation(controller: self)
        presenter = HomePresenterimplementation(view: self,
                                                interactor: interactor,
                                                router: router)
        interactor.presenter = presenter
    }
    
    private func initUI() {
        
    }
}

extension HomeViewController: HomeView {
    
}
