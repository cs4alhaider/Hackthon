//
//  HajjMangViewController.swift
//  HajjHackathonIOS
//
//  Created by Alsharif Abdullah on 01/08/2018.
//  Copyright © 2018 Abdullah Alhaider. All rights reserved.
//

import UIKit
import MapKit
class HajjMangViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var checkPointerOutlet: UIButton!
    @IBOutlet weak var orgnaizationsOutlet: UIButton!
    @IBOutlet weak var changeMapView: UIView!
    @IBOutlet weak var numberOfOrgnaizations: UIView!
    @IBOutlet weak var numberOfHujjajView: UIView!
    @IBOutlet weak var trafficPoliceOutlet: UIButton!
    
    let locationManager = CLLocationManager()
    var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        locationManager.delegate = self
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors =
            [UIColor.clear.cgColor,UIColor.white.withAlphaComponent(1).cgColor]
        //Use diffrent colors
        self.mapView.layer.addSublayer(gradientLayer)
        
        mapView.setZoomByDelta(delta: 0.2, animated: true)
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        setLayer()
    }
    
    func setLayer() {
        self.orgnaizationsOutlet.layer.cornerRadius = 5
        self.checkPointerOutlet.layer.cornerRadius = 5
        self.trafficPoliceOutlet.layer.cornerRadius = 5
        self.numberOfHujjajView.layer.cornerRadius = 5
        self.numberOfOrgnaizations.layer.cornerRadius = 5
        self.changeMapView.layer.cornerRadius = 5
        self.orgnaizationsOutlet.backgroundColor = .grayColor
        self.checkPointerOutlet.backgroundColor = .grayColor
        self.trafficPoliceOutlet.backgroundColor = .grayColor
        self.trafficPoliceOutlet.setTitleColor(UIColor.black, for: .normal)
        self.orgnaizationsOutlet.setTitleColor(UIColor.black, for: .normal)
        self.checkPointerOutlet.setTitleColor(UIColor.black, for: .normal)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkPointerAction(_ sender: Any) {
        self.checkPointerOutlet.backgroundColor = .mainColor
        self.orgnaizationsOutlet.backgroundColor = .grayColor
        self.trafficPoliceOutlet.backgroundColor = .grayColor
        self.trafficPoliceOutlet.setTitleColor(UIColor.black, for: .normal)
        self.orgnaizationsOutlet.setTitleColor(UIColor.black, for: .normal)
        self.checkPointerOutlet.setTitleColor(UIColor.white, for: .normal)
        
        let points = [
            ["title": "افواج",     "latitude": 21.4238392, "longitude": 39.8228172],
            ["title": "افواج",     "latitude": 21.420435, "longitude": 39.8267623],
            ["title": "افواج",     "latitude": 21.418872, "longitude": 39.8234583]
        ]
        for point in points {
            let annotation = MKPointAnnotation()
            annotation.title = point["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: point["latitude"] as! Double, longitude: point["longitude"] as! Double)
            mapView.addAnnotation(annotation)
            mapView.showAnnotations([annotation], animated: true)

        }
    }
    @IBAction func orgnaizationsAction(_ sender: Any) {
        self.checkPointerOutlet.backgroundColor = .grayColor
        self.orgnaizationsOutlet.backgroundColor = .mainColor
        self.trafficPoliceOutlet.backgroundColor = .grayColor
        self.trafficPoliceOutlet.setTitleColor(UIColor.black, for: .normal)
        self.orgnaizationsOutlet.setTitleColor(UIColor.white, for: .normal)
        self.checkPointerOutlet.setTitleColor(UIColor.black, for: .normal)
        
        let points = [
            ["title": "حملة الشريف",     "latitude": 21.429435, "longitude": 39.8185223],
            ["title": "حملة العحمي",     "latitude": 21.4294162, "longitude": 39.8199738],
            ["title": "حملة الحيدر",     "latitude": 21.4300892, "longitude": 39.8192238]
        ]
        for point in points {
            let annotation = MKPointAnnotation()
            annotation.title = point["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: point["latitude"] as! Double, longitude: point["longitude"] as! Double)
            mapView.addAnnotation(annotation)
            mapView.showAnnotations([annotation], animated: true)
        }

    }
    @IBAction func trafficPoliceAction(_ sender: Any) {
        self.checkPointerOutlet.backgroundColor = .grayColor
        self.orgnaizationsOutlet.backgroundColor = .grayColor
        self.trafficPoliceOutlet.backgroundColor = .mainColor
        self.trafficPoliceOutlet.setTitleColor(UIColor.white, for: .normal)
        self.orgnaizationsOutlet.setTitleColor(UIColor.black, for: .normal)
        self.checkPointerOutlet.setTitleColor(UIColor.black, for: .normal)
        
        let points = [
            ["title": "المرور",     "latitude": 21.4238392, "longitude": 39.8228172],
            ["title": "المرور",     "latitude": 21.420435, "longitude": 39.8267623],
            ["title": "المرور",     "latitude": 21.418872, "longitude": 39.8234583]
        ]
        for point in points {
            let annotation = MKPointAnnotation()
            annotation.title = point["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: point["latitude"] as! Double, longitude: point["longitude"] as! Double)
            mapView.addAnnotation(annotation)
            mapView.showAnnotations([annotation], animated: true)

        }

    }
    
   
}
