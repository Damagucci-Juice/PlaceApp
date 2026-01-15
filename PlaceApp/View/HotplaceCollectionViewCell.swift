//
//  HotplaceCollectionViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/15/26.
//

import UIKit

final class HotplaceCollectionViewCell: UICollectionViewCell {

    static let identifier = "HotplaceCollectionViewCell"

    @IBOutlet var linkImageView: UIImageView!

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var myBackgroundView: UIView!
    @IBOutlet var subtitleLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil
        subtitleLabel.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.likeTitle()
        subtitleLabel.likeSecondary()
        myBackgroundView.backgroundColor = .systemBlue.withAlphaComponent(0.2)
        layer.cornerRadius = 16
        clipsToBounds = true
    }


    override func layoutSubviews() {
        super.layoutSubviews()

        linkImageView.layer.cornerRadius = linkImageView.bounds.height / 2
        linkImageView.clipsToBounds = true
    }

    func configure(_ info: TouristSpot) {
        titleLabel.text = info.koreanName
        subtitleLabel.text = info.city
    }
}
