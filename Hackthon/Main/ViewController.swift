//
//  ViewController.swift
//  HajjHackathonIOS
//
//  Created by Alsharif Abdullah on 01/08/2018.
//  Copyright © 2018 Alsharif Abdullah. All rights reserved.
//

import UIKit
import FirebaseMessaging

class ViewController: UIViewController,MessagingDelegate {
    @IBOutlet weak var hajjOutlet: UIButton!
    @IBOutlet weak var hajjAdminOutlet: UIButton!
    @IBOutlet weak var hajjManagmentOutlet: UIButton!
    
    @IBOutlet weak var view1: UIVisualEffectView!
    @IBOutlet weak var view2: UIVisualEffectView!
    @IBOutlet weak var view3: UIVisualEffectView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setLayer()
        Messaging.messaging().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print("FCM Token:", fcmToken)
    }
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print(remoteMessage.appData)
    }
    func setLayer(){
        self.view1.clipsToBounds = true
        self.view2.clipsToBounds = true
        self.view3.clipsToBounds = true
        self.view1.layer.cornerRadius = 6
        self.view2.layer.cornerRadius = 6
        self.view3.layer.cornerRadius = 6

    }
    
    // should implement the code for the QR
    @IBAction func hajjAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
        nextVC.nextView = "view1"
        self.present(nextVC, animated: true, completion: nil)
    }
    @IBAction func hajjManagmentAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
        nextVC.nextView = "view2"
        self.present(nextVC, animated: true, completion: nil)
    }
    @IBAction func hajjAdminAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
        nextVC.nextView = "view3"
        self.present(nextVC, animated: true, completion: nil)
    }
    @IBAction func IneedHelpAction(_ sender: Any) {
        let storyboad = UIStoryboard(name: "Orgnaization", bundle: nil)
        let nextVC = storyboad.instantiateViewController(withIdentifier: "OrgnaizerMainViewController") as! OrgnaizerMainViewController
        self.present(nextVC, animated: true, completion: nil)
    }
}

