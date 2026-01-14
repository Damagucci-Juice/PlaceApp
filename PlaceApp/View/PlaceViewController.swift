//
//  ViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

import Kingfisher

final class PlaceViewController: UIViewController {

    @IBOutlet var headerSeparator: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var filterSegmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!

    private lazy var loadingView: UIView = {
        let result = UIView()
        result.backgroundColor = .systemGray6
        return result
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



    private var region: Region = .all {
        didSet {
            tableView.reloadData()
        }
    }

    private var regionaryDataSource: [City] {
        CityInfo.searchCity(
            by: region,
            keyword: searchKey()
        )
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
        setTableView()
        setTextField()
        setHeaderSeparator()
        setSegmentedControl()
    }
}

private extension PlaceViewController {

    func fetchFirstSceneImage() {
        let urls = CityInfo.city[0..<20].compactMap { URL(string: $0.image) }
        let prefetcher = ImagePrefetcher(urls: urls) { [weak self] _, _, _ in
            self?.handlePrefetchComplete()
        }
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

    func setTextField() {
        [UIControl.Event.editingDidEndOnExit, .editingChanged].forEach {
            searchTextField.addTarget(self, action: #selector(showSearchResult), for: $0)
        }

        searchTextField.setDefaultStyle("어디로 떠나고 싶으신가요?")
    }

    func setHeaderSeparator() {
        headerSeparator.backgroundColor = .lightGray
    }

    func setTableView() {
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)

        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.rowHeight = 200
        tableView.backgroundColor = .clear
    }

    func setSegmentedControl() {
        Region.allCases.forEach { r in
            filterSegmentControl.setTitle(r.text, forSegmentAt: r.rawValue)
        }
        filterSegmentControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
    }

    @objc
    private func segmentValueChanged(_ sender: UISegmentedControl) {
        guard let newRegion = Region(rawValue: sender.selectedSegmentIndex) else { return }

        region = newRegion
    }

    private func searchKey() -> String? {
        guard let text = searchTextField.text
        else { return nil }
        let replaced = text.lowercased().replacingOccurrences(of: " ", with: "")
        if replaced.isEmpty { return nil }

        return replaced
    }

    @objc
    private func showSearchResult() {
        tableView.reloadData()
    }
}

extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        regionaryDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }

        cell.configure(regionaryDataSource[indexPath.row], keyword: searchKey())
        cell.selectionStyle = .none
        return cell
    }
}
