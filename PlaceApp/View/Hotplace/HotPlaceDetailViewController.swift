//
//  HotPlaceDetailViewController.swift
//  PlaceApp
//
//  Created by Gucci on 1/19/26.
//

import UIKit
import MapKit

import SnapKit

final class HotPlaceDetailViewController: UIViewController {

    private lazy var mapView = {
        let result = MKMapView()
        result.delegate = self
        return result
    }()

    private lazy var infoStackView = {
        let result = UIStackView()
        result.backgroundColor = .white
        result.setCorner(16)
        result.axis = .vertical
        result.alignment = .leading
        result.spacing = 8.0
        result.distribution = .equalSpacing
        return result
    }()

    private lazy var spotNameStackView = {
        let result = UIStackView()
        result.axis = .horizontal
        result.alignment = .leading
        result.distribution = .fillProportionally
        result.spacing = 4

        


        return result
    }()

    private let tour: TouristSpot

    init(_ tour:TouristSpot) {
        self.tour = tour
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupAttribute()
        setupNaviItem()
    }
}

extension HotPlaceDetailViewController: Drawable {
    func setupUI() {
        view.addSubview(mapView)

        mapView.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalToSuperview().dividedBy(4)
        }
    }

    func setupAttribute() {
        setMapView()
    }

    func setMapView() {
        let targetCoordinate = CLLocationCoordinate2D(latitude: tour.latitude, longitude: tour.longitude) // San Francisco

        // Define the visible area (zoom level)
        let region = MKCoordinateRegion(
            center: targetCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Adjust span for zoom
        )

        let annotation = MKPointAnnotation()
        annotation.coordinate = targetCoordinate
        annotation.title = tour.koreanName
        annotation.subtitle = tour.city

        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }

    func setupNaviItem() {
        navigationItem.title = tour.koreanName
    }
}


extension HotPlaceDetailViewController: MKMapViewDelegate {

}
