//
//  UIView+.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

extension UIView {
    func setAlpha(_ value: CGFloat) {
        backgroundColor = backgroundColor?.withAlphaComponent(value)

//        opacity   : 자식 뷰도 영향
//        alpha     : 자기만 영향
    }
}
