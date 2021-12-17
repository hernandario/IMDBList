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
    @IBOutlet weak var tableView: UITableView!
    private let searchController = UISearchController(searchResultsController: nil)
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
        presenter?.viewDidLoad()
    }
    
    private func initUI() {
        setTableView()
        setSearchBar()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        title = "IMDB Search Utility"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setTableView() {
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
    }
}

extension HomeViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(identifier: "identifier here")
    }
}

extension HomeViewController: HomeView {
    
}
