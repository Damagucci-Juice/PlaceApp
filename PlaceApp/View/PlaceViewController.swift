//
//  ViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

import UIKit

final class PlaceViewController: UIViewController {

    @IBOutlet var headerSeparator: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var filterSegmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!

    private var region: Region = .all {
        didSet {
            tableView.reloadData()
        }
    }

    private var regionaryDataSource: [City] {
        switch region {
        case .all:
            return CityInfo.city
        case .domestic:
            return CityInfo.domesticCities
        case .oversea:
            return  CityInfo.internationalCities
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttributes()
    }

    private func setupAttributes() {
        navigationItem.title = "범죄 도시"
        setTableView()
        setHeaderSeparator()
        setSegmentedControl()
    }
}

private extension PlaceViewController {
    func setHeaderSeparator() {
        headerSeparator.backgroundColor = .lightGray
    }

    func setTableView() {
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)

        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.rowHeight = 200
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
}

extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        regionaryDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }

        let item = regionaryDataSource[indexPath.row]
        cell.configure(item,
                       UIImage(systemName: "person.fill"))

        return cell
    }
}
