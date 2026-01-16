//
//  UIViewController+.swift
//  PlaceApp
//
//  Created by Gucci on 1/15/26.
//

import UIKit

extension UIViewController {
    func setCommonBackgroundColor() {
        view.backgroundColor = .white
    }
}

@objc
protocol Drawable: AnyObject {
    func setupUI()
    func setupAttribute()
    @objc optional func setupNaviItem()
}

protocol Bindable {
    associatedtype VM = ViewModelProtocol

    func setupBinding(_ vm: VM)
}

protocol ViewModelProtocol { }
