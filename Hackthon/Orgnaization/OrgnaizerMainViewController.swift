//
//  OrgnaizerMainViewController.swift
//  Hackthon
//
//  Created by Alsharif Abdullah on 01/08/2018.
//  Copyright © 2018 Alsharif Abdullah. All rights reserved.
//

import UIKit
import MapKit
import UserNotifications
class OrgnaizerMainViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var statusStackView: UIStackView!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var statusText: UITextView!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var numberOfHujjajView: UIView!
    @IBOutlet weak var numberOfKhyamView: UIView!
    
    var location: CLLocation?
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        setupLayer()
    }

    func setupLayer(){
        self.statusView.layer.cornerRadius = 6
        self.numberOfHujjajView.layer.cornerRadius = 6
        self.numberOfKhyamView.layer.cornerRadius = 6
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors =
            [UIColor.clear.cgColor,UIColor.white.withAlphaComponent(1).cgColor]
        self.mapView.showsUserLocation = true
        self.mapView.layer.addSublayer(gradientLayer)
        addRadiusCircle(location: CLLocation(latitude: self.mapView.userLocation.coordinate.longitude , longitude: self.mapView.userLocation.coordinate.latitude ))
        NotificationCenter.default.addObserver(self, selector: #selector(getStatusViewBack), name: NSNotification.Name(rawValue: "showBackgroundView"), object: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRadiusCircle(location: CLLocation){
        let circle = MKCircle(center: location.coordinate, radius: 20)
        self.mapView.add(circle)
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let overlayRenderer : MKCircleRenderer = MKCircleRenderer(overlay: overlay);
        overlayRenderer.lineWidth = 1.0
        overlayRenderer.strokeColor = UIColor.red
        return overlayRenderer
    }
    
 //542
   @objc func getStatusViewBack(){
        UIView.animate(withDuration: 0.5) {
            self.statusStackView.frame.origin.y = 542

        }
    }
    @IBAction func infoAction(_ sender: Any) {
        print("Rrr")
        UIView.animate(withDuration: 0.4, animations: {
            self.statusStackView.frame.origin.y = 1500
        }) { (ok) in
            if ok {
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
                self.present(nextVC, animated: true, completion: nil)
            }
            else {
                print("ERROR")
            }
        }
    }
    
}

