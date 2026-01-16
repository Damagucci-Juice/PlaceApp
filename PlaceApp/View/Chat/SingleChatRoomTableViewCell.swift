//
//  SingleChatRoomTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

class SingleChatRoomTableViewCell: UITableViewCell, Reusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = .blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
