//
//  DetailViewController.swift
//  IMDBList
//
//  Created by Hernán Villamil on 18/12/21.
//

import Foundation
import UIKit

protocol DetailView: AnyObject {
    
}

class DetailViewController: UIViewController {
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var presenter: DetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailViewController: DetailView {
    
}
