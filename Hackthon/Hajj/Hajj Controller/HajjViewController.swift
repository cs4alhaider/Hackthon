//
//  HajjViewController.swift
//  HajjHackathonIOS
//
//  Created by Abdullah Alhaider on 01/08/2018.
//  Copyright © 2018 Abdullah Alhaider. All rights reserved.
//

import UIKit
import MapKit
import Helper4Swift

class HajjViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var importantDatesButton: UIButton!
    @IBOutlet weak var whereAmIButton: UIButton!
    @IBOutlet weak var HajjHungerstationButton: UIButton!
    @IBOutlet weak var needHelpButton: UIButton!
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapEffect()
        setupAtFirst()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func profileButtonPresed(_ sender: UIButton) {
    }
     
    @IBAction func WhereAmIPreesed(_ sender: UIButton) {
        Helper4Swift.shakePhone(style: .light)
        showMap()
    }
    
    @IBAction func importantDatesPressed(_ sender: UIButton) {
        Helper4Swift.shakePhone(style: .light)
        showImaportentDates()
    }
    
    @IBAction func HajjHungerstationPressed(_ sender: UIButton) {
        Helper4Swift.shakePhone(style: .light)
        openHungerstation()
    }
    
    @IBAction func exitButton(_ sender: Any) {
        Helper4Swift.shakePhone(style: .light)
        backgroundView.isHidden = false
        exitButton.isHidden = true
        profileButton.isHidden = false
        backgrouncViewUP()
    }
    
    @IBAction func needHelpPresed(_ sender: UIButton) {
        Helper4Swift.shakePhone(style: .light)
        UIView.animate(withDuration: 0.4, animations: {
            self.backgroundView.frame.origin.y = 1500
        }) { (true) in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Hajj", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    
    @objc fileprivate func backgrouncViewUP(){
        UIView.animate(withDuration: 0.4, animations: {
            self.backgroundView.frame.origin.y = 542
            self.backgroundView.alpha = 1
            self.exitButton.alpha = 0
        })
    }
    
    fileprivate func backgrouncViewDOWN(){
        backgroundView.frame.origin.y = 1500
        backgroundView.alpha = 0
        exitButton.alpha = 1
    }
    
    fileprivate func mapEffect() {
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.white.withAlphaComponent(1).cgColor]
        mapView.layer.addSublayer(gradientLayer)
    }
    
    fileprivate func showMap() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.backgrouncViewDOWN()
        }) { (true) in
            self.backgroundView.isHidden = true
            self.exitButton.isHidden = false
            self.profileButton.isHidden = true
        }
        
        mapView.showsUserLocation = true
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    fileprivate func showImaportentDates(){
        
        UIView.animate(withDuration: 0.4, animations: {
            self.backgroundView.frame.origin.y = 1500
        }) { (true) in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Hajj", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ImportantDatesViewController") as! ImportantDatesViewController
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    fileprivate func openHungerstation(){
        let openUrl = URL(string: "hungerstation://")
        UIApplication.shared.open(openUrl! , options:[:]) { (success) in
            if !success
            {
                if let url = URL(string: "https://itunes.apple.com/sa/app/hungerstation/id596011949?mt=8"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        }
    }
    
    fileprivate func setupAtFirst() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(backgrouncViewUP), name: NSNotification.Name(rawValue: "showBackgroundView"), object: nil)
        
        mapView.delegate = self 
        
        profileButton.setImage("profile".asImage, for: .normal)
        profileButton.setTitle("", for: .normal)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.imageView?.layer.cornerRadius = profileButton.frame.size.height / 2
        profileButton.layer.cornerRadius = profileButton.frame.size.height / 2
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = UIColor.mainColor.cgColor
        
        exitButton.isHidden = true
        exitButton.setImage("exit".asImage, for: .normal)
        exitButton.imageView?.contentMode = .scaleAspectFit
        exitButton.alpha = 0
        
        whereAmIButton.backgroundColor = .grayColor
        importantDatesButton.backgroundColor = .grayColor
        HajjHungerstationButton.backgroundColor = .grayColor
        needHelpButton.backgroundColor = .mainColor
        
        whereAmIButton.setTitleColor(.black, for: .normal)
        importantDatesButton.setTitleColor(.black, for: .normal)
        HajjHungerstationButton.setTitleColor(.black, for: .normal)
        needHelpButton.setTitleColor(.white, for: .normal)
        
        backView.layer.cornerRadius = 5
        
        whereAmIButton.layer.cornerRadius = 5
        importantDatesButton.layer.cornerRadius = 5
        HajjHungerstationButton.layer.cornerRadius = 5
        needHelpButton.layer.cornerRadius = 5
    }
    
}
extension HajjViewController: MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
        }
    }
    
//    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
//        backgrouncViewDOWN()
//    }
//
//    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//        backgrouncViewUP()
//    }
}

extension HajjViewController: CLLocationManagerDelegate {
    
}
