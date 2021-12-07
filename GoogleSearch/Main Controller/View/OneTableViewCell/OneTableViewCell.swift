//
//  OneTableViewCell.swift
//  GoogleSearch
//
//  Created by Алексей on 03.12.2021.
//

import UIKit
import SDWebImage

struct TableViewCellModel {
    let link: String?
    let title: String?
    let src: String?
}

final class OneTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var linkLabel: UILabel!
    @IBOutlet private weak var srcImageView: UIImageView!
    
    override class func description() -> String {
        return "OneTableViewCell"
    }

    func setupWithModel(model: TableViewCellModel) {
        titleLabel.text = model.title
        linkLabel.text = model.link
        
        srcImageView.sd_setImage(with: URL(string: model.src ?? "sdf"),
                                 placeholderImage: nil,
                                 options: .refreshCached, context: nil)
        
        if let name = model.link {
            linkLabel.text = name
        }
        
        if let nameTitle = model.title {
            titleLabel.text = nameTitle
        }
    }
}
