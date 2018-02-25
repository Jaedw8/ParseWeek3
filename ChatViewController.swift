//
//  ChatViewController.swift
//  ParseWeek3
//
//  Created by Jasmine Edwards on 2/25/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController,UITableViewDataSource
{
    
    
    
    func onTimer() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
    }
    
    let chatMessage = PFObject(className: "Message")
    
    chatMessage["text"] = chatMessageField.text ?? ""
    
    //save the message to Parse database, or print any errors
    chatMessage.saveInBackground { (success: Bool, error: Error?) in
    if success {
    print("The message was saved!")
    self.chatMessageField.text = ""
    } else if let error = error {
    print("Problem saving message: \(error.localizedDescription)")
    }
    }

    var query = Post.query()
    
    query.getObjectInBackgroundWithId("Message")
    {
    (post: PFObject?, error: NSError?) -> Void in
    if error == nil && gameScore != nil {
    print(post)
    } else {
    print(error)
    }
    }

override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}


