//
//  ViewController.swift
//  LibraryApp
//
//  Created by Lalli Mann on 03/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    
    @IBOutlet weak var adminButton: UIButton!
    @IBOutlet weak var studentButton: UIButton!
    
    
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        adminButton.layer.cornerRadius = 10
        studentButton.layer.cornerRadius = 10
        
        if launchedBefore  {
            print("Not first launch.")
        }
        else {
            let stuUserName = [123,456,789,999]
            let stuPassword = ["pass","pass","pass","pass"]
            let bookName = ["book1","book2","book3","book4","book5"]
            let bookAuthor = ["author1","author2","author3","author4","author5"]
            
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            
            UserDefaults.standard.set(stuUserName, forKey: "stuU")
            UserDefaults.standard.set(stuPassword, forKey: "stuP")
            UserDefaults.standard.set(bookName, forKey: "bookU")
            UserDefaults.standard.set(bookAuthor, forKey: "bookA")
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

