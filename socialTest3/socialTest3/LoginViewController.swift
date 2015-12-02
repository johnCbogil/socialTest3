//
//  LoginViewController.swift
//  socialTest3
//
//  Created by Bogil, John on 12/1/15.
//  Copyright © 2015 Bogil, John. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonDidPress(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(self.usernameTextField.text!, password:self.passwordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewControllerWithIdentifier("notifyViewController")
                self.navigationController?.pushViewController(viewController, animated:true)
                print("login success")
                
            } else {
                // The login failed. Check error to see why.
                print("login failure")
            }
        }
    }
    
}