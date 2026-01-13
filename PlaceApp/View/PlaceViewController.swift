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
        CityInfo.searchCity(
            by: region,
            keyword: searchKey()
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttributes()
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
