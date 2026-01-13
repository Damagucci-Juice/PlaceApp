//
//  CityTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit
import Kingfisher

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

    func configure(_ item: City, keyword: String?) {
        titleLabel.setAttributedText(item.title, keyword)
        descriptionLabel.setAttributedText(item.explain, keyword)

        if let url = URL(string: item.image) {
            posterImageView.kf.setImage(with: url)
        }
    }

    // Cell Life Cycle 에 대해서 공부해야할 듯
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.layer.cornerRadius = posterImageView.frame.height / 2
        posterImageView.clipsToBounds = true
    }
}

private extension CityTableViewCell {
    func setupAttributes() {
        contentView.backgroundColor = .white
        backgroundColor = .white
        backgroundPaddingView.backgroundColor = .clear

        descriptionBackgrounView.setAlpha(0.5)
        posterImageView.setAlpha(0.5)
        posterImageView.contentMode = .scaleAspectFill

        titleLabel.likeTitle()
        descriptionLabel.likeSecondary()
    }
}
