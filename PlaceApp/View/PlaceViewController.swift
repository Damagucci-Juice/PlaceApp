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

    private var time: Float = 0.0
    private var timer: Timer?
    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .lightGray
        view.progressTintColor = .systemBlue
        view.progress = 0.1
        return view
    }()

    private var regionaryDataSource: [City] {
        CityInfo.city
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupAttributes()
        fetchFirstSceneImage()
    }

    private func setupLayout() {
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
    }

    private func setupAttributes() {
        navigationItem.title = "인기 도시"
        setCityColleciontView()
    }
}

private extension PlaceViewController {

    func setCityColleciontView() {
        cityCollectionView.backgroundColor = .systemOrange

        let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)

        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        let width = 200.0
        let height = width * 1.6
        layout.itemSize = CGSize(width: width, height: height)
        cityCollectionView.collectionViewLayout = layout
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


}

extension PlaceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CityInfo.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(CityInfo.city[indexPath.item])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(
            name: "City",
            bundle: nil
        )

        let city = CityInfo.city[indexPath.item]

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

            present(newNaviController, animated: true)
        }

    }

}
