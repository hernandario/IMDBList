//
//  DetailInteractor.swift
//  IMDBList
//
//  Created by Hernán Villamil on 18/12/21.
//

import Foundation

protocol DetailInteractor: AnyObject {
    func fetchDetailWithIdentifier(_ identifier: String)
}

class DetailInteractorimplementation {
    private var repository: DetailRepository
    weak var presenter: DetailPresenterDelegate?
    
    init(repository: DetailRepository) {
        self.repository = repository
    }
}

extension DetailInteractorimplementation: DetailInteractor {
    func fetchDetailWithIdentifier(_ identifier: String) {
        repository.fetchDetailWitIdentifier(identifier) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.presenter?.fetchDetailDidSuccess(result)
            case .failure:
                self?.presenter?.fetchDetailDidFail()
            }
        }
    }
}
