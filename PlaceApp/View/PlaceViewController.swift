//
//  ViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

import Kingfisher

final class PlaceViewController: UIViewController {

    private lazy var loadingView: UIView = {
        let result = UIView()
        result.backgroundColor = .systemGray6
        return result
    }()

    @IBOutlet var cityCollectionView: UICollectionView!

    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let deviceWidth = self.view.window!.windowScene!.screen.bounds.width
        let spacing: CGFloat = 20.0
        let inset: CGFloat = 20.0
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)

        // cal width, height by screen size
        let itemCountPerRow: CGFloat = 2
        let insetVal1 = inset * 2
        let spacingVal1 = spacing * (itemCountPerRow - 1)
        let cellWidth = (deviceWidth - insetVal1 - spacingVal1) / itemCountPerRow

        let collectionViewHeight = cityCollectionView.bounds.height
        let itemCountPerCol: CGFloat = 2
        let insetVal2 = inset * 2
        let spacingVal2 = spacing * (itemCountPerCol - 1)
        let cellHeight = (collectionViewHeight - insetVal2 - spacingVal2) / itemCountPerCol

        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        return layout
    }()

    private var time: Float = 0.0
    private var timer: Timer?
    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .lightGray
        view.progressTintColor = .systemBlue
        view.progress = 0.1
        return view
    }()

    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private var regionaryDataSource: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchFirstSceneImage()
        regionaryDataSource = CityInfo.city
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNaviTitle()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupAttributes()
    }

    private func setupUI() {
        view.addSubview(loadingView)

        loadingView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])

        loadingView.addSubview(progressView)

        progressView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: loadingView.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: loadingView.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: loadingView.trailingAnchor)
        ])

        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(profileBarButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
    }

    private func setupAttributes() {
        setCityColleciontView()
    }

    @objc private func profileBarButtonTapped() {
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }

    private func setNaviTitle() {
        let userNickname = UserDefaults.standard.string(forKey: nicknameKey)
        if let userNickname {
            navigationItem.title = "\(userNickname)님 환영합니다."
        } else {
            navigationItem.title = "인기도시"
        }

    }
}

private extension PlaceViewController {

    func setCityColleciontView() {
        cityCollectionView.backgroundColor = .systemOrange

        let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)

        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        cityCollectionView.register(CustomCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomCollectionHeaderView.identifier)

        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        cityCollectionView.collectionViewLayout = collectionViewLayout
        cityCollectionView.backgroundColor = .clear
    }

    func fetchFirstSceneImage() {
        let urls = CityInfo.city[0..<20].compactMap { URL(string: $0.image) }
        let prefetcher = ImagePrefetcher(urls: urls, completionHandler:  { [weak self] _, _, _ in
            self?.handlePrefetchComplete()
        })
        prefetcher.start()
    }

    func handlePrefetchComplete() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 0.03,
            target: self,
            selector: #selector(setProgress),
            userInfo: nil,
            repeats: true
        )
    }

    /// 로딩뷰 숨김 및 타이머 해제
    /// 프로그래스바 진도율 업데이트
    @objc func setProgress() {
        time += 0.05
        progressView.setProgress(time, animated: false)

        if time >= 1.0 {
            self.loadingView.isHidden = true
            timer?.invalidate()
        }
    }

    @objc func segementedValueChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // 전체
            regionaryDataSource = CityInfo.city
        case 1:
            // 국내
            regionaryDataSource = CityInfo.domesticCities
        default:
            // 해외
            regionaryDataSource = CityInfo.internationalCities
        }
        cityCollectionView.reloadData()
    }
}

extension PlaceViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        regionaryDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(regionaryDataSource[indexPath.item])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(
            name: "City",
            bundle: nil
        )

        let city = regionaryDataSource[indexPath.item]

        if city.isDomestic {
            // domestic -> push
            let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController


            vc.setupInfo(city)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            // overseas -> Present
            let vc = sb.instantiateViewController(withIdentifier: OverseaViewController.identifier) as! OverseaViewController

            vc.setContent(city)


            let newNaviController = UINavigationController(rootViewController: vc)

            newNaviController.modalPresentationStyle = .fullScreen

            present(newNaviController, animated: true)
        }

    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomCollectionHeaderView.identifier, for: indexPath) as? CustomCollectionHeaderView else {
                return CustomCollectionHeaderView()
            }

            header.configure()
            header.segmentedControl.addTarget(self, action: #selector(segementedValueChange), for: .valueChanged)
            return header
        }

        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 40)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
