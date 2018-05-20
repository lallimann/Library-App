//
//  StudentLoginViewController.swift
//  LibraryApp
//
//  Created by Lalli Mann on 03/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit

class StudentLoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var passwordStudent: UITextField!
    @IBOutlet weak var usernameStudent: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameStudent.delegate = self
        passwordStudent.delegate = self
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "stuLogin")
        {
            let scndViewController = segue.destination as? StudentLoginHomeTableViewController
            let username =  usernameStudent.text
            scndViewController?.usernameLogin = username!
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        
        
        
        let stuUserNames = UserDefaults.standard.array(forKey: "stuU") 
        let stuPasswords = UserDefaults.standard.array(forKey: "stuP")
        
        var chk = false
        
        if (identifier == "stuLogin")
        {
            
            
            for (us,pass) in zip(stuUserNames!, stuPasswords!)
            {
                print("\(us) \(pass)")
                if(String(describing: us)==usernameStudent.text && String(describing: pass)==passwordStudent.text)
                {
                    chk = true
                    break
                }
                else
                {
                    chk = false
                }
            }
        }
        else{
            chk = false
        }
        
        print(chk)
        
        if chk == false
        {
            let alert = UIAlertController(title: "Try Again", message: "Invalid username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        return chk
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameStudent.resignFirstResponder()
        passwordStudent.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        usernameStudent.resignFirstResponder()
        passwordStudent.resignFirstResponder()
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
