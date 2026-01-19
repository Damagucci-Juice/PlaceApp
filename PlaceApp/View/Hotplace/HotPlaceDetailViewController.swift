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
        result.alignment = .fill
        result.spacing = 8.0
        result.distribution = .fill

        result.isLayoutMarginsRelativeArrangement = true
        result.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return result
    }()

    private let interSpacing = 8.0

    private lazy var spotNameStackView = {
        let result = UIStackView()
        result.axis = .horizontal
        result.alignment = .center
        result.distribution = .fillProportionally
        result.spacing = interSpacing

        result.addArrangedSubview(makeImage("network"))
        result.addArrangedSubview(makeLabel(tour.englishName))
        return result
    }()

    private lazy var cityNameStackView = {
        let result = UIStackView()
        result.axis = .horizontal
        result.alignment = .center
        result.distribution = .fillProportionally
        result.spacing = interSpacing

        result.addArrangedSubview(makeImage("info.circle"))
        result.addArrangedSubview(makeLabel(tour.city))
        return result
    }()

    private lazy var mapStackView = {
        let result = UIStackView()
        result.axis = .horizontal
        result.alignment = .center
        result.distribution = .fillProportionally
        result.spacing = interSpacing

        result.addArrangedSubview(makeImage("map"))
        result.addArrangedSubview(makeLabel(tour.address))
        return result
    }()

    private lazy var phoneStackView = {
        let result = UIStackView()
        result.axis = .horizontal
        result.alignment = .center
        result.distribution = .fillProportionally
        result.spacing = interSpacing

        result.addArrangedSubview(makeImage("phone.fill"))
        result.addArrangedSubview(makeLabel(tour.phoneNumber))
        return result
    }()

    private lazy var urlStackView = {
        let result = UIStackView()
        result.axis = .horizontal
        result.alignment = .center
        result.distribution = .fillProportionally
        result.spacing = interSpacing

        result.addArrangedSubview(makeImage("safari"))
        result.addArrangedSubview(makeLabel(tour.websiteURL))
        return result
    }()

    private lazy var coordinationStackView = {
        let result = UIStackView()
        result.axis = .horizontal
        result.alignment = .center
        result.distribution = .fillProportionally
        result.spacing = interSpacing

        result.addArrangedSubview(makeImage("paperplane.circle"))
        result.addArrangedSubview(makeLabel("\(tour.latitude), \(tour.longitude)"))
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

    private func makeLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }

    private func makeImage(_ image: String) -> UIImageView {
        let image = UIImage(systemName: image)
        let result = UIImageView(image: image)
        result.contentMode = .scaleAspectFit
        result.tintColor = .tintColor
        result.frame = .init(origin: .zero,
                             size: .init(width: 20, height: 20))
        return result
    }
}

extension HotPlaceDetailViewController: Drawable {
    func setupUI() {
        view.addSubview(mapView)
        view.addSubview(infoStackView)

        mapView.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalToSuperview().dividedBy(3)
        }

        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(mapView)
        }
    }

    func setupAttribute() {
        view.backgroundColor = .secondarySystemBackground
        setMapView()
        setupInfoViews()
    }


    func setupNaviItem() {
        navigationItem.title = tour.koreanName
    }

    private func setupInfoViews() {
        [
            spotNameStackView,
            cityNameStackView,
            mapStackView,
            phoneStackView,
            urlStackView,
            coordinationStackView
        ].forEach { stack in
            infoStackView.addArrangedSubview(stack)
        }
    }
    
    private func setMapView() {
        let targetCoordinate = CLLocationCoordinate2D(latitude: tour.latitude, longitude: tour.longitude) // San Francisco
        
        // Define the visible area (zoom level)
        let region = MKCoordinateRegion(
            center: targetCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03) // Adjust span for zoom
        )
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = targetCoordinate
        annotation.title = tour.koreanName
        annotation.subtitle = tour.city
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        mapView.setCorner(16)
    }
}


extension HotPlaceDetailViewController: MKMapViewDelegate {

}
