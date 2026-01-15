//
//  HotplaceADCollectionViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/15/26.
//

import UIKit

class HotplaceADCollectionViewCell: UICollectionViewCell {

    static let identifier =  "HotplaceADCollectionViewCell"

    @IBOutlet var capsuleView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var adBackgroundView: UIView!

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(item: TouristSpot) {
        titleLabel.text = item.koreanName
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupAttribute()
    }

    func setupAttribute() {
        titleLabel.likeTitle()
        
        capsuleView.setCorner(capsuleView.bounds.height / 2)

        adBackgroundView.setCorner(16)
        adBackgroundView.setBorder(.orange.withAlphaComponent(0.8))
    }
}
