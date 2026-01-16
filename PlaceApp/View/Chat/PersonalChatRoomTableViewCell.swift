//
//  PersonalChatRoomTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

import Kingfisher

final class PersonalChatRoomTableViewCell: UITableViewCell, Reusable {



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()

    }

    override func prepareForReuse() {
        super.prepareForReuse()

    }
}

extension PersonalChatRoomTableViewCell: Drawable {
    // storyboard constraints
    func setupUI() { }

    func setupAttribute() {
        contentView.backgroundColor = .blue
    }
}

extension PersonalChatRoomTableViewCell: CellBasicProtocol {
    func configure(_ item: ChatRoom) {
        print(#function, item.chatRoomId)
    }
}
