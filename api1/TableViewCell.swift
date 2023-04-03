//
//  TableViewCell.swift
//  api1
//
//  Created by R94 on 01/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var l1: UILabel!
    
    @IBOutlet weak var l2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
