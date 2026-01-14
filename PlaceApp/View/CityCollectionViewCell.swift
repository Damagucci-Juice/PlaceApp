//
//  CityCollectionViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/14/26.
//

import UIKit

final class CityCollectionViewCell: UICollectionViewCell {

    static var identifier: String { String(describing: Self.self) }

    @IBOutlet var cityTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttributes()
    }

    func configure(_ item: City) {
        cityTitleLabel.text = item.title
    }

}

extension CityCollectionViewCell {
    func setupAttributes() {
        contentView.backgroundColor = .white

        cityTitleLabel.likeTitle()
    }
}
