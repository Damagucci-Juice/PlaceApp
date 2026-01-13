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

//        오파 서티 자식 뷰도 영향
//        알파 자기만 영향
    }
}
