//
//  DetailViewController.swift
//  IMDBList
//
//  Created by Hernán Villamil on 18/12/21.
//

import Foundation
import UIKit
import Kingfisher

protocol DetailView: AnyObject {
    func setUI()
    func updateWithModel(_ model: DetailModel)
    func shareText(_ text: [String])
    func updateAfterFailedRequest()
}

class DetailViewController: UIViewController {
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var presenter: DetailPresenter?
    private var detailInfo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    @IBAction func didTapShareButton(_ sender: Any) {
        presenter?.didTapShare()
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = detailInfo[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title:  "action", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            let cell = self.tableView.cellForRow(at: indexPath)
            UIPasteboard.general.string = cell?.textLabel?.text
            success(true)
        })
        action.title = "Copy"
        action.backgroundColor = .green
        return UISwipeActionsConfiguration(actions: [action])
    }

}

private extension DetailViewController {
    func setPosterView() {
        posterView.contentMode = .scaleAspectFit
    }
    
    func setTableView() {
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension DetailViewController: DetailView {
    func setUI() {
        setTableView()
    }
    
    func updateWithModel(_ model: DetailModel) {
        let url = URL(string: model.poster)
        posterView.kf.setImage(with: url)
        detailInfo = model.info
        tableView.reloadData()
    }
    
    func shareText(_ text: [String]) {
        let activityViewController = UIActivityViewController(activityItems: text, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func updateAfterFailedRequest() {
        detailInfo = []
        tableView.reloadData()
        let alert = UIAlertController.getAlertForType(.datailLoadFail, refreshAction: presenter?.viewDidLoad)
        present(alert, animated: true, completion: nil)
    }
}
