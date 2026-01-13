//
//  UITextField+.swift
//  PlaceApp
//
//  Created by Gucci on 1/14/26.
//

import UIKit

extension UITextField {
    func setDefaultStyle(_ placeHolder: String) {
        placeholder = placeHolder
        leftView = UIView(frame: .init(x: .zero, y: .zero, width: 15, height: .zero))
        leftViewMode = .always
        backgroundColor = .white
        borderStyle = .none
        setCorner(20)
        setBorder(.gray)
    }
}
