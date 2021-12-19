//
//  HomeInteractor.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

protocol HomeInteractor: AnyObject {
    func fetchSearchWithText(_ text: String)
}

class HomeInteractorimplementation {
    private var repository: SearchRepository
    weak var presenter: HomePresenterDelegate?
    
    init(repository: SearchRepository) {
        self.repository = repository
    }
}

extension HomeInteractorimplementation: HomeInteractor {
    func fetchSearchWithText(_ text: String) {
        repository.fetchSearchWithText(text) { [weak self] (result) in
            switch result {
            case .success(let searchResult):
                self?.presenter?.searchDidSuccess(searchResult)
            case .failure(let error):
                self?.presenter?.searchDidFail(error)
            }
        }
    }
}
