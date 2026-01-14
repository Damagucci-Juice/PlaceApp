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
        textColor = .label
        textAlignment = .center
        numberOfLines = 1
        backgroundColor = .clear
    }

    func likeSecondary() {
        font = .systemFont(ofSize: 16)
        textColor = .secondaryLabel
        textAlignment = .center
        numberOfLines = 1
        backgroundColor = .clear
    }

    func setAttributedText(_ fullText: String, _ keyword: String? = nil) {
        guard let keyword else {
            text = fullText
            return
        }

        let attributedTitle = NSMutableAttributedString(string: fullText)
        let givenRange =  (fullText.lowercased() as NSString).range(of: keyword)
        attributedTitle.addAttribute(.backgroundColor,  value: UIColor.orange,  range: givenRange)
        attributedTitle.addAttribute(.foregroundColor,  value: UIColor.white,   range: givenRange)

        attributedText = attributedTitle
    }

}
