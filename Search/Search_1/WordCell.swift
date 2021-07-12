//
//  WordCell.swift
//  Search_1
//
//  Created by 전상민 on 2021/05/15.
//

import UIKit

// UITableViewCell를 사용하기 위해서는 identifier를 작성해야함(보통 class이름과 똑같이 만듬)
// viewDidLoad()에 등록 후 사용한다.
class WordCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
