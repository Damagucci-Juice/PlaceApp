//
//  UIScrollView+.swift
//  PlaceApp
//
//  Created by Gucci on 1/18/26.
//

import UIKit

extension UIScrollView {

    var scrolledToTop: Bool {
        let topEdge = 0 - contentInset.top
        return contentOffset.y <= topEdge
    }

    var isBottom: Bool {
        let bottomEdge = contentSize.height + contentInset.bottom - bounds.height
        return contentOffset.y >= bottomEdge - 15
    }

}
