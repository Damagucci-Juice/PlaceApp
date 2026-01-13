//
//  CityTableViewCell.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

final class CityTableViewCell: UITableViewCell {

    static let identifier = "CityTableViewCell"

    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ item: City) {
        titleLabel.text = item.title
    }

}
