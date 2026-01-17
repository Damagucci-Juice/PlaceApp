//
//  InsetLabel.swift
//  PlaceApp
//
//  Created by Gucci on 1/17/26.
//

import UIKit

final class InsetLabel: UILabel {
    @IBInspectable var contentInsets: UIEdgeInsets = .zero {
        didSet {
            setNeedsLayout()
            invalidateIntrinsicContentSize()
        }
    }

    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: contentInsets)
        super.drawText(in: insetRect)
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return CGSize(width: width, height: height)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return CGSize(width: width, height: height)
    }

    override var bounds: CGRect {
        didSet { preferredMaxLayoutWidth = bounds.width - (contentInsets.left + contentInsets.right) }
    }
}

extension InsetLabel {
    func setInset(_ horizontalInset: CGFloat, _ verticalInset: CGFloat) {
        self.contentInsets = UIEdgeInsets(top: verticalInset,
                                          left: horizontalInset,
                                          bottom: verticalInset,
                                          right: horizontalInset)
    }
}
