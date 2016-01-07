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
        
//        PFInstallation *installation = [PFInstallation currentInstallation];
        let installation = PFInstallation.currentInstallation()
//        installation[@"User"] = [PFUser currentUser].username;
        installation["User"] = PFUser.currentUser()?.username
//        [installation saveInBackground];
        installation.saveInBackground()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notifyButtonDidPress(sender: AnyObject) {
        
//        // Create our Installation query
//        PFQuery *pushQuery = [PFInstallation query];
        let pushQuery = PFInstallation.query()
//        [pushQuery whereKey:@"User" equalTo:self.usernameTextField.text];
        pushQuery?.whereKey("User", equalTo: self.usernameTextField.text!)
//        
//        // Send push notification to query
//        PFPush *push = [[PFPush alloc] init];
        let push = PFPush.init()
//        [push setQuery:pushQuery]; // Set our Installation query
        push.setQuery(pushQuery)
//        [push setMessage:@"🙏"];
        push.setMessage("🙏")
//        [push sendPushInBackground];
        push.sendPushInBackground()
    }
    
    @IBAction func logoutButtonDidPress(sender: AnyObject) {
        PFUser.logOut()
    }

}