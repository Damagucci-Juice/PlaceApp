//
//  PersonalChatRoomTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import UIKit

import Kingfisher

final class PersonalChatRoomTableViewCell: UITableViewCell, Reusable {

    @IBOutlet var paddedBackgroundView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastChatLabel: UILabel!
    @IBOutlet var updatedDateLabel: UILabel!

    var onImageViewTapped: ((User?) -> Void)?

    private var opponent: User?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        lastChatLabel.text = nil
        updatedDateLabel.text = nil
        onImageViewTapped = nil
        opponent = nil
    }
}

extension PersonalChatRoomTableViewCell: Drawable {
    // storyboard constraints
    func setupUI() { }

    func setupAttribute() {
        paddedBackgroundView.backgroundColor = .clear
        contentView.backgroundColor = .white

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            guard let self else { return }
            self.profileImageView.setCorner(self.profileImageView.bounds.height / 2)
        }
        profileImageView.contentMode = .scaleAspectFill

        nameLabel.likeTitle()
        lastChatLabel.likeSubheader()
        updatedDateLabel.likeSecondary()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        profileImageView.addGestureRecognizer(tapGesture)
        profileImageView.isUserInteractionEnabled = true
    }

    @objc
    func imageViewTapped() {
        print(#function)
        onImageViewTapped?(opponent)
    }
}

extension PersonalChatRoomTableViewCell: CellBasicProtocol {
    func configure(_ item: ChatRoom) {
        // TODO: - 진짜 필요한 정보, 마지막 메시지, 상대방 이름, 사진
        let opponent = mockUsers.first { user in
            user.userId == item.participantIds.last!
        }
        guard let opponent else {
            print(#function, "No User")
            return
        }
        self.opponent = opponent
        let counterImage = URL(string:  opponent.profileImage)!

        profileImageView.kf.setImage(with: counterImage)

        nameLabel.text = opponent.userName
        lastChatLabel.text = item.messages.last?.content
        updatedDateLabel.text = item.messages.last?.timestamp.formatted(date: .numeric, time: .omitted)
    }
}
