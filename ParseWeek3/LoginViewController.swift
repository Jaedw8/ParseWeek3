//
//  LoginViewController.swift
//  ParseWeek3
//
//  Created by Jasmine Edwards on 2/24/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UITableViewCell
{
//usernameLabel
    //passwordlabel
    
    
    
    var alertController: UIAlertController!
    var alertError: String = ""
    
    //@IBAction func onLogin(_ sender: Any)
    {
        
        let username = usernameLabel.text ?? ""
        let password = PasswordLabel.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user: PFUser?, error: Error?) in
            if let error = error
            {
                print("User log in failed: \(error.localizedDescription)")
                self.alertError = error.localizedDescription
                self.isLoggedIn()
            }
        else
            {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        
        
    }
    
    
    func isLoggedIn()
    {
        self.alertController = UIAlertController(title: "Login Error", message: alertError, preferredStyle: .alert)
        
        //try to connect again
        let tryAgain = UIAlertAction(title: "Try Again", style: .cancel)
        {
            (action) in
            self.usernameLabel.text = ""
            self.PasswordLabel.text = ""
            
            

        }
    
        // add action to alertController
        alertController.addAction(tryAgain)
        present(alertController, animated: true, completion: nil)
    }
        
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    
}
