//
//  ViewController.swift
//  lab-Login
//
//  Created by Eknoor on 30/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else if sender == forgotPasswordBtn{
            segue.destination.navigationItem.title = "Forgot Password"
            
        } else {
            segue.destination.navigationItem.title = "Login Page"
        }
    }

    @IBAction func forgotUsernameTapped(_ sender: Any) {
        performSegue(withIdentifier: "NextScreen", sender: forgotUsernameButton)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        performSegue(withIdentifier: "NextScreen", sender: forgotPasswordBtn)
    }
}

