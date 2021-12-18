//
//  HomePresenter.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

protocol HomePrensenter: AnyObject {
    func viewDidLoad()
    func didSelectItem(index: Int)
    func searchWithText(_ text: String)
}

protocol HomePresenterDelegate: AnyObject {
    func searchDidSuccess(_ result: SearchDTO)
    func searchDidFail()
}

class HomePresenterimplementation {
    let view: HomeView
    let interactor: HomeInteractor
    let router: HomeRouter
    private var searchResult: SearchDTO?
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenterimplementation: HomePrensenter {
    func viewDidLoad() {
        view.setUI()
    }
    
    func didSelectItem(index: Int) {
        guard let item = searchResult?.items[index] else { return }
        router.goToDetailWithIdentifier(item.imdbId)
    }
    
    func searchWithText(_ text: String) {
        interactor.fetchSearchWithText(text)
    }
}

extension HomePresenterimplementation: HomePresenterDelegate {
    func searchDidSuccess(_ result: SearchDTO) {
        searchResult = result
        view.updateTableWithItems(searchResult?.items ?? [])
    }
    
    func searchDidFail() {
        
    }
}
