//
//  MyChatTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/17/26.
//

import UIKit

final class MyChatTableViewCell: UITableViewCell {

    @IBOutlet var chatLabel: InsetLabel!

    @IBOutlet var timelineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        chatLabel.text = nil
        timelineLabel.text = nil
    }
}

extension MyChatTableViewCell: Reusable { }

extension MyChatTableViewCell: CellBasicProtocol {
    func configure(_ item: Message) {
        chatLabel.text = item.content

        timelineLabel.text = item
            .timestamp.timeInSouthKorea
    }
}

extension MyChatTableViewCell: Drawable {
    func setupUI() { }

    func setupAttribute() {
        contentView.backgroundColor = .white
        chatLabel.likeBody()
        chatLabel.setInset(8, 4)
        chatLabel.setCorner(8)
        chatLabel.backgroundColor = .systemGray5
        chatLabel.setBorder(.secondaryLabel)
        timelineLabel.likeSecondary()
    }
}


extension MyChatTableViewCell: Tappable {
    func handleDidTapped() {
        chatLabel.numberOfLines = chatLabel.numberOfLines == 0 ? 4 : 0
    }
}
