//
//  NewUserViewController.swift
//  LibraryApp
//
//  Created by Lalli Mann on 04/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var passConfirmTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idTextfield.delegate = self
        passTextfield.delegate = self
        passConfirmTextfield.delegate = self
        
        saveButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        idTextfield.resignFirstResponder()
        passTextfield.resignFirstResponder()
        passConfirmTextfield.resignFirstResponder()
        return true
    }
    
    @IBAction func saveButtonACcion(_ sender: UIButton) {
        
        var stuUserNames = UserDefaults.standard.array(forKey: "stuU")
        var stuPasswords = UserDefaults.standard.array(forKey: "stuP")
        
        var chk = true
        
        for us in stuUserNames!
        {
            if(String(describing: us)==idTextfield.text)
            {
                chk = false
                let alert = UIAlertController(title: "Try Again", message: "Username alreasy taken", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        if(chk==true && idTextfield.text != nil && passConfirmTextfield.text != nil && passTextfield.text != nil)
        {
            if(passTextfield.text == passConfirmTextfield.text)
            {
                stuUserNames?.append(idTextfield.text!)
                stuPasswords?.append(passTextfield.text!)
                
                UserDefaults.standard.set(stuUserNames, forKey: "stuU")
                UserDefaults.standard.set(stuPasswords, forKey: "stuP")
                
                idTextfield.text = nil
                passTextfield.text = nil
                passConfirmTextfield.text = nil
            }
            else
            {
                let alert = UIAlertController(title: "Try Again", message: "Password not matching", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                
                passTextfield.text = nil
                passConfirmTextfield.text = nil
            }
        }
        
        
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
