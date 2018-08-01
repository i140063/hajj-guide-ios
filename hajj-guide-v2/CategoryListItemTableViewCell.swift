//
//  CategoryListItemTableViewCell.swift
//  hajj-guide-v2
//
//  Created by Project  on 13/07/2018.
//  Copyright © 2018 Kindred Spirits. All rights reserved.
//

import UIKit

class CategoryListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var categorylabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
