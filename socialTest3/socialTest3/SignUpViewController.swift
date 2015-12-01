//
//  SignUpViewController.swift
//  socialTest3
//
//  Created by Bogil, John on 12/1/15.
//  Copyright © 2015 Bogil, John. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // "let" is immutable 
        let user = PFUser()
        user.username = self.usernameTextField.text
        user.password = self.passwordTextField.text
        user.signUpInBackgroundWithBlock { (BOOL success, NSError error) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
                print("Sign Up Sucess")
            }
            else {
                print("Sign Up Failure")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpButtonDidPress(sender: AnyObject) {
    }
}