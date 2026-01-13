//
//  UIView+.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

extension UIView {

    //        opacity   : 자식 뷰도 영향
    //        alpha     : 자기만 영향
    func setAlpha(_ value: CGFloat) {
        backgroundColor = backgroundColor?.withAlphaComponent(value)
    }

    func setCorner(_ value: CGFloat) {
        layer.cornerRadius = value
        clipsToBounds = true
    }

    func setBorder(_ color: UIColor, _ width: CGFloat = 1) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }

    func setSpecificCorner(_ corners: CACornerMask, _ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
}
