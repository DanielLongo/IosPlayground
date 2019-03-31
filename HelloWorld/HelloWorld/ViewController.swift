//
//  ViewController.swift
//  HelloWorld
//
//  Created by Daniel Longo on 3/31/19.
//  Copyright © 2019 Daniel Longo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var message = "boo"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showMessage(sender: UIButton) {
        let alertController = UIAlertController(title: "Welcome to My First App", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func switchClicked(sender: UISwitch) {
        if sender.isOn {
            message = "yayayaya"
        }
        else {
            message = "booooo"
        }
    }


}

