//
//  HomeViewController.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation
import UIKit

protocol HomeView: AnyObject {
    func setUI()
    func updateTableWithItems(_ models: [IMDBItem])
    func updateAfterFailedRequest()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let searchController = UISearchController(searchResultsController: nil)
    private var models = [IMDBItem]()
    var presenter: HomePrensenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initScene()
        presenter?.viewDidLoad()
    }
}


private extension HomeViewController {
    func initScene() {
        let repository = IMDBSearchRepository()
        let interactor = HomeInteractorimplementation(repository: repository)
        let router = HomeRouterImplementation(controller: self)
        let presenterImplementation = HomePresenterimplementation(view: self,
                                                interactor: interactor,
                                                router: router)
        interactor.presenter = presenterImplementation
        self.presenter = presenterImplementation
    }
    
    func setNavigationBar() {
        title = "IMDB Search Utility"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setSearchBar() {
        searchController.searchBar.searchTextField.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func setTableView() {
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        ItemCell.registerCell(for: tableView)
    }
    
    func searchWithText(_ text: String) {
        presenter?.searchWithText(text)
    }
}

extension HomeViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      guard let text = searchController.searchBar.text,
            !text.isEmpty,
            text.count % 4 == 0 else {
          return
      }
     searchWithText(text)
  }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        searchWithText(text)
        return true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ItemCell.getCell(tableView, cellForRowAt: indexPath, with: models[indexPath.row]) else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if models.count >= 1 {
            return "\(models.count) results for the search"
        } else {
            return nil
        }
    }
}

extension HomeViewController: HomeView {
    func setUI() {
        setTableView()
        setSearchBar()
        setNavigationBar()
    }
    
    func updateTableWithItems(_ models: [IMDBItem]) {
        self.models = models
        tableView.reloadData()
    }
    
    func updateAfterFailedRequest() {
        self.models = []
        tableView.reloadData()
        let alert = UIAlertController.getAlertForType(.searchFail)
        present(alert, animated: true, completion: nil)
    }
}
