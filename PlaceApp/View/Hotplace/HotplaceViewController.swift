//
//  HotplaceViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/15/26.
//

import UIKit

import SnapKit

final class HotplaceViewController: UIViewController, Reusable {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let result = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        return result
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupAttribute()
    }

    private func setupUI() {
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setupAttribute() {
        navigationItem.title = "Hot 명소"
        setCommonBackgroundColor()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        let xib = UINib(nibName: HotplaceCollectionViewCell.identifier, bundle: nil)
        collectionView.register(
            xib,
            forCellWithReuseIdentifier: HotplaceCollectionViewCell.identifier
        )

        let adXib = UINib(nibName: HotplaceADCollectionViewCell.identifier, bundle: nil)
        collectionView.register(
            adXib,
            forCellWithReuseIdentifier: HotplaceADCollectionViewCell.identifier
        )

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let deviceWidth = self.view.window!.windowScene!.screen.bounds.width
        let spacing: CGFloat = 4.0
        let inset: CGFloat = 4.0
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)

        // cal width, height by screen size
        let itemCountPerRow: CGFloat = 3
        let insetVal1 = inset * 2
        let spacingVal1 = spacing * (itemCountPerRow - 1)
        let cellWidth = (deviceWidth - insetVal1 - spacingVal1) / itemCountPerRow

        let collectionViewHeight = collectionView.bounds.height
        let itemCountPerCol: CGFloat = 7
        let insetVal2 = inset * 2
        let spacingVal2 = spacing * (itemCountPerCol - 1)
        let cellHeight = (collectionViewHeight - insetVal2 - spacingVal2) / itemCountPerCol

        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.collectionViewLayout = layout
    }
}


extension HotplaceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TouristSpotInfo.spots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = TouristSpotInfo.spots[indexPath.item]
        if item.ad {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotplaceADCollectionViewCell.identifier, for: indexPath) as? HotplaceADCollectionViewCell else { return UICollectionViewCell() }

            cell.configure(item: item)

            return cell

        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotplaceCollectionViewCell.identifier, for: indexPath)
                    as? HotplaceCollectionViewCell else { return UICollectionViewCell() }

            cell.configure(item)

            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = TouristSpotInfo.spots[indexPath.item]
        let vc = HotPlaceDetailViewController(item)
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
