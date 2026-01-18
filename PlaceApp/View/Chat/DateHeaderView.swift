//
//  DateHeaderView.swift
//  PlaceApp
//
//  Created by Gucci on 1/18/26.
//

import UIKit

import SnapKit

final class DateHeaderView: UITableViewHeaderFooterView {
    private lazy var dateLabel: InsetLabel = {
        let result = InsetLabel()
        result.likeSubheader()
        result.setInset(8, 4)
        result.setCorner(8)
        result.setBorder(.black)
        return result
    }()

    private lazy var deviderView: UIView = {
        let result = UIView()
        result.backgroundColor = .secondaryLabel
        return result
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
        setupAttribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ date: Date) {
        dateLabel.text = date.formatted(date: .abbreviated, time: .omitted)
    }

}

extension DateHeaderView: Reusable { }

extension DateHeaderView: Drawable {
    func setupUI() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(deviderView)

        deviderView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }

        dateLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        dateLabel.layer.zPosition = 1
    }
    
    func setupAttribute() {
        dateLabel.backgroundColor = .systemGray5
        dateLabel.textColor = .black
    }
}
