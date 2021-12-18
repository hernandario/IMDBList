//
//  DetailRouter.swift
//  IMDBList
//
//  Created by Hernán Villamil on 18/12/21.
//

import Foundation
import UIKit

protocol DetailRouter: AnyObject {
    static func createSceneWithIdentifier(_ identifier: String) -> DetailViewController?
}

class DetailRouterImplmentation: DetailRouter {
    static func createSceneWithIdentifier(_ identifier: String) -> DetailViewController? {
        let storyBoardIdentifier = String(describing: DetailViewController.self)
        let storyBoard = UIStoryboard(name: storyBoardIdentifier, bundle: .main)
        guard let controller = storyBoard.instantiateViewController(identifier: storyBoardIdentifier) as? DetailViewController else { return nil }
        let interactor = DetailInteractorimplementation(repository: IMDBDetailRepository())
        let presenter = DetailPresenterImplementation(view: controller, interactor: interactor, detailIdentifier: identifier)
        interactor.presenter = presenter
        controller.presenter = presenter
        return controller
    }
}
