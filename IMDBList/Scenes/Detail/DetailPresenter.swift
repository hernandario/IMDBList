//
//  DetailPresenter.swift
//  IMDBList
//
//  Created by Hernán Villamil on 18/12/21.
//

import Foundation

protocol DetailPresenter: AnyObject {
    func viewDidLoad()
    func didTapShare()
}

protocol DetailPresenterDelegate: AnyObject {
    func fetchDetailDidSuccess(_ result: DetailDTO)
    func fetchDetailDidFail()
}

class DetailPresenterImplementation {
    let view: DetailView
    let interactor: DetailInteractor
    var detailIdentifier: String
    private var detailDTO: DetailDTO?
    
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
        view.setUI()
        interactor.fetchDetailWithIdentifier(detailIdentifier)
    }
    
    func didTapShare() {
        guard let detail = detailDTO else { return }
        let model = DetailModel(detail)
        let text = model.info.joined(separator: "\n")
        view.shareText([text])
    }
}

extension DetailPresenterImplementation: DetailPresenterDelegate {
    func fetchDetailDidSuccess(_ result: DetailDTO) {
        self.detailDTO = result
        let model = DetailModel(result)
        view.updateWithModel(model)
    }
    
    func fetchDetailDidFail() {
        
    }
    
}
