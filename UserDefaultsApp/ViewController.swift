//
//  ViewController.swift
//  UserDefaultsApp
//
//  Created by Timur Saidov on 16/10/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    
    @IBAction func donePressed(_ sender: UIButton) {
        guard firstNameTextField.text?.isEmpty == false && secondNameTextField.text?.isEmpty == false else {
            formatAlert()
            return
        }
        
        if let _ = Double(firstNameTextField.text!), let _ = Double(secondNameTextField.text!) {
            formatAlert()
        } else {
            userNameLabel.isHidden = false
            userNameLabel.text = firstNameTextField.text! + " " + secondNameTextField.text!
            UserDefaults.standard.set(userNameLabel.text, forKey: "UserName")
        }
        
        firstNameTextField.text = nil
        secondNameTextField.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.isHidden = true
        
        if let userName = UserDefaults.standard.value(forKey: "UserName") {
            userNameLabel.isHidden = false
            userNameLabel.text = userName as? String
        }
    }

    func formatAlert() {
        let ac = UIAlertController(title: "Wrong format!", message: "Please fill all fields", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
}

