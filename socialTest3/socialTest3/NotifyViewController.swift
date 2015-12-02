//
//  NotifyViewController.swift
//  socialTest3
//
//  Created by Bogil, John on 12/1/15.
//  Copyright © 2015 Bogil, John. All rights reserved.
//

import UIKit
import Parse

class NotifyViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var notifyButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = PFUser.currentUser()?.username
        self.navigationItem.setHidesBackButton(true, animated: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notifyButtonDidPress(sender: AnyObject) {
    }
    
    @IBAction func logoutButtonDidPress(sender: AnyObject) {
        PFUser.logOut()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewControllerWithIdentifier("homeViewController")
//        self.navigationController.popToViewController(viewController, animated: true)
    }

}