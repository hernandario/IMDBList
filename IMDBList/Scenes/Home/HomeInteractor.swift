//
//  HomeInteractor.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

protocol HomeInteractor: AnyObject {
    
}

class HomeInteractorimplementation {
    private var repository: SearchRepository
    weak var presenter: HomePrensenter?
    
    init(repository: SearchRepository) {
        self.repository = repository
    }
}

extension HomeInteractorimplementation: HomeInteractor {
    
}
