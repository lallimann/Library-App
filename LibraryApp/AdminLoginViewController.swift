//
//  AdminLoginViewController.swift
//  LibraryApp
//
//  Created by Lalli Mann on 03/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit

class AdminLoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameAdmin: UITextField!
    @IBOutlet weak var passwordAdmin: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameAdmin.delegate = self
        passwordAdmin.delegate = self
        loginButton.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loginButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "adminLogin")
        {
            if(userNameAdmin.text == "admin" && passwordAdmin.text == "admin")
            {
                return true
            }
            else
            {
                let alert = UIAlertController(title: "Try Again", message: "Invalid username or password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                return false
                
            }
        }
        else
        {
            let alert = UIAlertController(title: "Try Again", message: "Invalid username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameAdmin.resignFirstResponder()
        passwordAdmin.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        userNameAdmin.resignFirstResponder()
        passwordAdmin.resignFirstResponder()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
