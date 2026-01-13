//
//  CityTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

final class CityTableViewCell: UITableViewCell {

    static let identifier = "CityTableViewCell"

    @IBOutlet var backgroundPaddingView: UIView!
    @IBOutlet var descriptionBackgrounView: UIView!
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttributes()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
    }

    func configure(_ item: City, _ asset: UIImage?) {
        titleLabel.text = item.title
        descriptionLabel.text = item.explain
        posterImageView.image = asset
    }
}

private extension CityTableViewCell {
    func setupAttributes() {
        contentView.backgroundColor = .white
        backgroundColor = .white
        backgroundPaddingView.backgroundColor = .clear

        descriptionBackgrounView.setAlpha(0.5)
        posterImageView.setAlpha(0.5)
//        posterImageView.contentMode = .scaleAspectFit // 비율 유지하고 맞닿은 변에 꽉 채움
        posterImageView.contentMode = .scaleAspectFill    // 비율을 유지하고 늘리면서 꽉채움
//        posterImageView.contentMode = .scaleToFill  비율 상관없이 빈 공간이 나올 수 없게 꽉 채움

        titleLabel.likeTitle()
        descriptionLabel.likeSecondary()
    }
}
