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
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpButtonDidPress(sender: AnyObject) {
        
        // "let" is immutable
        let user = PFUser()
        user.username = self.usernameTextField.text
        user.password = self.passwordTextField.text
        
        user.signUpInBackgroundWithBlock { (BOOL success, NSError error) -> Void in
            
            if error == nil {
                
                print("Sign Up Sucess")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewControllerWithIdentifier("notifyViewController")
                self.navigationController?.pushViewController(viewController, animated:true)
                
            }
            else {
                print("Sign Up Failure")
            }
        }
    }
}