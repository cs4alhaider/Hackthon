//
//  HelpViewController.swift
//  HajjHackathonIOS
//
//  Created by Abdullah Alhaider on 02/08/2018.
//  Copyright © 2018 Abdullah Alhaider. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let cellID = "HelpCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    fileprivate func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        backView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backView.layer.cornerRadius = 30
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss()
    }
    
    
    fileprivate func dismiss(){
        dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showBackgroundView"), object: nil)
        }
    }
    
    
    
    
    
}
extension HelpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

extension HelpViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ImportantDatesTableViewCell else { return UITableViewCell()}
        cell.titleLabel.text = "Get Help"
        return cell
    }
}
