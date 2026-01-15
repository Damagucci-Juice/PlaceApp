//
//  CityCollectionViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/14/26.
//

import UIKit

import Kingfisher

final class CityCollectionViewCell: UICollectionViewCell {

    static var identifier: String { String(describing: Self.self) }

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var cityDescriptionLabel: UILabel!

    static let failImage = UIImage(resource: .defaultTour)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttributes()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        cityImageView.image = nil
        cityTitleLabel.text = nil
        cityDescriptionLabel.text = nil
    }

    func configure(_ item: City) {
        cityTitleLabel.text = item.title
        cityDescriptionLabel.numberOfLines = 2
        cityDescriptionLabel.text = item.explain

        guard let url = URL(string: item.image) else { return }
        cityImageView
            .kf
            .setImage(with: url) { [weak self] result in
                // error handling
                _ = result.mapError { [weak self] error in
                    guard let self else { return error }
                    self.cityImageView.image = Self.failImage
                    return error
                }
            }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cityImageView.setCorner(cityImageView.frame.height / 2)
    }
}

extension CityCollectionViewCell {
    func setupAttributes() {
        contentView.backgroundColor = .white

        cityTitleLabel.likeTitle()
        cityDescriptionLabel.likeSecondary()
        cityImageView.contentMode = .scaleAspectFill
    }
}
