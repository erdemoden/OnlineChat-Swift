//
//  ChatTables.swift
//  onlinechat
//
//  Created by erdem öden on 29.01.2022.
//

import UIKit

class ChatTables: UITableViewCell {
    @IBOutlet weak var ChatType: UILabel!
    @IBOutlet weak var CellBackGround: UIView!
    @IBOutlet weak var ChatTopics: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        CellBackGround.layer.cornerRadius = 20
        CellBackGround.layer.borderColor = UIColor.black.cgColor
        CellBackGround.layer.borderWidth = 5
        CellBackGround.clipsToBounds = true
        // Configure the view for the selected state
    }

}
