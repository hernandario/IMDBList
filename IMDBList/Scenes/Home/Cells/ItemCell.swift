//
//  ItemCell.swift
//  IMDBList
//
//  Created by Hernán Villamil on 18/12/21.
//

import UIKit
import Kingfisher

class ItemCell: UITableViewCell {
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setWithModel(_ model: IMDBItem) {
        loadPoster(model.poster)
        titleLabel.text = model.title
        yearLabel.text = model.year
    }
}

private extension ItemCell {
    func loadPoster(_ poster: String) {
        let url = URL(string: poster)
        let placeholder = UIImage(named: "imdbPlaceholder")
        posterView.kf.setImage(with: url, placeholder: placeholder)
    }
}

extension ItemCell {
    public static func registerCell(for tableView: UITableView) {
        let identifier = String(describing: Self.self)
        let nib = UINib(nibName: identifier, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    public static func getCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, with model: IMDBItem) -> ItemCell?  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Self.self), for: indexPath) as? ItemCell else { return nil }
        cell.setWithModel(model)
        return cell
    }
}
