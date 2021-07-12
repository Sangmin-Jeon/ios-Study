//
//  userTableViewCell.swift
//  MVVM_Binding_Pattern
//
//  Created by 전상민 on 2021/07/09.
//

import UIKit

class userTableViewCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
