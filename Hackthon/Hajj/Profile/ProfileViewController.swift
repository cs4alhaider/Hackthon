//
//  ProfileViewController.swift
//  Hackthon
//
//  Created by Abdullah Alhaider on 02/08/2018.
//  Copyright © 2018 Alsharif Abdullah. All rights reserved.
//

import UIKit
import Helper4Swift

class ProfileViewController: UIViewController {


    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    
    @IBOutlet weak var exitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func exitButtonPresed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func setup() {
        
        backView.applyViewDesign(masksToBounds: false, shadowColor: .darkGray, cornerRadius: 10, shadowOpacity: 0.2, shadowOffset: CGSize(width: 0, height: 0), shadowRadius: 9)
        
        
    }
    
    
    

}
