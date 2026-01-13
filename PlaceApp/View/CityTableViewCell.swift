//
//  CityTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit
import Kingfisher

final class CityTableViewCell: UITableViewCell {

    @IBOutlet var backgroundPaddingView: UIView!
    @IBOutlet var descriptionBackgrounView: UIView!
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    static private let failImage = UIImage(named: "defaultTourImage")

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

        guard let url = URL(string: item.image) else { return }
        posterImageView
            .kf
            .setImage(with: url) { [weak self] result in
                // error handling
                _ = result.mapError { [weak self] error in
                    guard let self else { return error }
                    self.posterImageView.image = Self.failImage
                    return error
                }
            }
    }

    // view drawing cycle 학습 필요
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        setCircleCrop()
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

    // MAKR: - 정원
    func setCircleCrop() {
        posterImageView.layer.cornerRadius = posterImageView.frame.height / 2
        posterImageView.clipsToBounds = true
    }
}
