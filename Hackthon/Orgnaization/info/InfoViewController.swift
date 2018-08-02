//
//  InfoViewController.swift
//  Hackthon
//
//  Created by Alsharif Abdullah on 02/08/2018.
//  Copyright © 2018 Alsharif Abdullah. All rights reserved.
//

import UIKit
import UserNotifications

class InfoTableViewCell: UITableViewCell {
    @IBOutlet weak var ticketLabel: UILabel!
    
}
class InfoViewController: UIViewController {

    @IBOutlet weak var tablwView: UITableView!
    
    var tickets: [String] = ["حاج مفقود","حاج يحتاج الاسعاف","طلب الامن"]
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)

    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        view.addSubview(indicator)
        indicator.activityIndicatorViewStyle = .gray
        indicator.center = view.center
        return indicator
    }()
    var panGestureRecognizer: UIPanGestureRecognizer?
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.startAnimating()
        self.tablwView.reloadData()
        tablwView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        tablwView.layer.cornerRadius = 30
        self.indicator.stopAnimating()
        self.indicator.hidesWhenStopped = true
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGestureRecognizer!)
    }
    
    @objc func panGestureAction(_ panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: view)
        
        if panGesture.state == .began {
            originalPosition = view.center
            currentPositionTouched = panGesture.location(in: view)
        } else if panGesture.state == .changed {
            view.frame.origin = CGPoint(
                x: translation.x,
                y: translation.y
            )
        } else if panGesture.state == .ended {
            let velocity = panGesture.velocity(in: view)
            
            if velocity.y >= 1500 {
                UIView.animate(withDuration: 0.2
                    , animations: {
                        self.view.frame.origin = CGPoint(
                            x: self.view.frame.origin.x,
                            y: self.view.frame.size.height
                        )
                }, completion: { (isCompleted) in
                    if isCompleted {
                        self.dismiss(animated: true, completion: {
                             NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showBackgroundView"), object: nil)
                        })
                    }
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.center = self.originalPosition!
                })
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension InfoViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell {
            cell.ticketLabel.text = self.tickets[indexPath.row]
            return cell 
            }
        return UITableViewCell()
        }
    
}

