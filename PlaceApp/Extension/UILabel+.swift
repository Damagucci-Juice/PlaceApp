//
//  UILabel+.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

extension UILabel {
    func likeTitle() {
        font = .boldSystemFont(ofSize: 22)
        textColor = .white
        textAlignment = .right
        numberOfLines = 1
        backgroundColor = .clear
    }

    func likeSecondary() {
        font = .systemFont(ofSize: 16)
        textColor = .white
        textAlignment = .left
        numberOfLines = 1
        backgroundColor = .clear
    }
}
