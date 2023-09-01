//
//  
//  ExampleFourView.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import UIKit
import MapKit

class ExampleFourView: UIViewController {
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    var presenter: ExampleFourPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.getLocations()
        
        setupView()
        setupAutoLayout()
    }
    
    func setupView() {
        title = "Map pins"
        view.backgroundColor = .white
        view.addSubview(mapView)
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ExampleFourView: ExampleFourViewProtocol {
    func locationsSuccess(locations: Locations) {
        for location in locations.data ?? [] {
            let point = MKPointAnnotation()
            if let state = location.state, let latitude = location.latitude, let longitude = location.longitude {
                point.title = state
                point.coordinate = CLLocationCoordinate2DMake(latitude ,longitude)
                mapView.addAnnotation(point)
            }
        }
    }
    
    func locationsFailure() {
        
    }
}
