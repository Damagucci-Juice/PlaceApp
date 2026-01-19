//
//  OthersChatTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/17/26.
//

import UIKit

import Kingfisher

final class OthersChatTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var chatLabel: InsetLabel!

    @IBOutlet var timelineLabel: UILabel!

    var onImageViewTapped: ((User?) -> Void)?

    private var opponent: User?


    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        chatLabel.text = nil
        timelineLabel.text = nil
        onImageViewTapped = nil
        opponent = nil
    }
}

extension OthersChatTableViewCell: Reusable { }

extension OthersChatTableViewCell: CellBasicProtocol {
    func configure(_ item: Message) {
        guard let opponent = mockUsers.first(where: { $0.userId == item.senderId }),
              let imageURL = URL(string: opponent.profileImage)
        else { return }

        profileImageView.kf.setImage(with: imageURL)
        self.opponent = opponent
        nameLabel.text = opponent.userName
        chatLabel.text = item.content
        timelineLabel.text = item.timestamp.timeInSouthKorea
    }
}

extension OthersChatTableViewCell: Drawable {
    func setupUI() { }

    func setupAttribute() {
        nameLabel.likeTitle()
        chatLabel.likeBody()
        chatLabel.setInset(8, 4)
        chatLabel.setCorner(8)
        chatLabel.setBorder(.secondaryLabel)
        chatLabel.backgroundColor = .white
        timelineLabel.likeSecondary()
        profileImageView.contentMode = .scaleAspectFill
        contentView.backgroundColor = .white

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            guard let self else { return }
            profileImageView
                .setCorner(
                    profileImageView.bounds.height / 2
                )

        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        profileImageView.addGestureRecognizer(tapGesture)
    }

    @objc
    private func imageViewTapped() {
        onImageViewTapped?(opponent)
    }
}

extension OthersChatTableViewCell: Tappable {
    func handleDidTapped() {
        chatLabel.numberOfLines = chatLabel.numberOfLines == 0 ? 4 : 0
    }
}
