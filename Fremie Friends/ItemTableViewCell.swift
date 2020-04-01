//
//  ItemTableViewCell.swift
//  Fremie Friends
//
//  Created by Dema Abu Adas on 2020-03-13.
//  Copyright © 2020 Dema Abu Adas. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
