//
//  ViewController.swift
//  HelloWorld
//
//  Created by Daniel Longo on 3/31/19.
//  Copyright © 2019 Daniel Longo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var callsBlockedLab: UILabel!
    @IBOutlet weak var switchAct: UISwitch!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    var message = "boo"
    var callsBlocked = 0;
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
//        background.backgroundColor = UIColor(patternImage: UIImage(named : "Screen Shot 2019-03-10 at 8.16.08 AM")!)
        shareButton.layer.cornerRadius = 6
        callsBlocked = defaults.integer(forKey: "callsBlocked")
        updateCallsBlockedLab()
        if switchAct.isOn {
            statusLabel.text = "Activated"
        }
        else {
            statusLabel.text = "Deactivated"
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    func updateCallsBlockedLab() {
        defaults.set(callsBlocked, forKey: "callsBlocked")
        callsBlockedLab.text = String(callsBlocked)
    }
    
    @IBAction func showMessage(sender: UIButton) {
        let alertController = UIAlertController(title: "Welcome to My First App", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func sharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["Check out Call Wall! Never get spam calls again. So far I've blocked " + String(callsBlocked) + " calls."], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func blockCall(sender: UIButton) {
        callsBlocked += 1
        updateCallsBlockedLab()
    }
    @IBAction func switchClicked(sender: UISwitch) {
        if sender.isOn {
            message = "yayayaya"
            statusLabel.text = "Activated"
            background.alpha = 1
//            background.backgroundColor = UIColor(patternImage: UIImage(named : "Screen Shot 2019-03-10 at 8.16.08 AM")!)//, alpha: 1)
        }
        else {
            message = "booooo"
            statusLabel.text = "Deactivated"
            background.alpha = 0.9
//            background.backgroundColor = UIColor(patternImage: UIImage(named : "Screen Shot 2019-03-10 at 8.16.08 AM")!)//, alpha: 0.75)
        }
    }
    
}

