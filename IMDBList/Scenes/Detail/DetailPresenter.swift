//
//  DetailPresenter.swift
//  IMDBList
//
//  Created by Hernán Villamil on 18/12/21.
//

import Foundation

protocol DetailPresenter: AnyObject {
    func viewDidLoad()
}

protocol DetailPresenterDelegate: AnyObject {
    func fetchDetailDidSuccess(_ result: DetailDTO)
    func fetchDetailDidFail()
}

class DetailPresenterImplementation {
    let view: DetailView
    let interactor: DetailInteractor
    var detailIdentifier: String
    
    init(view: DetailView,
         interactor: DetailInteractor,
         detailIdentifier: String) {
        self.view = view
        self.interactor = interactor
        self.detailIdentifier = detailIdentifier
    }
}

extension DetailPresenterImplementation: DetailPresenter {
    func viewDidLoad() {
        interactor.fetchDetailWithIdentifier(detailIdentifier)
    }
}

extension DetailPresenterImplementation: DetailPresenterDelegate {
    func fetchDetailDidSuccess(_ result: DetailDTO) {
        
    }
    
    func fetchDetailDidFail() {
        
    }
    
}
