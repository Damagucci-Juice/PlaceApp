//
//  CustomCollectionHeaderView.swift
//  PlaceApp
//
//  Created by Gucci on 1/14/26.
//
import UIKit

import SnapKit

class CustomCollectionHeaderView: UICollectionReusableView {
    static let identifier = "CustomCollectionHeaderView"

    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["전체", "국내", "해외"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    
    func configure() {
        backgroundColor = .clear
        addSubview(segmentedControl)

        segmentedControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
