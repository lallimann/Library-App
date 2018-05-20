//
//  SaveNewBookViewController.swift
//  LibraryApp
//
//  Created by Lalli Mann on 04/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit

class SaveNewBookViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var bookNameTextField: UITextField!
    @IBOutlet weak var authorNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 10
        
        bookNameTextField.delegate = self
        authorNameTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonAction(_ sender: Any) {
        
        let book = bookNameTextField.text
        let author = authorNameTextField.text
        
        
        var nameArray = (UserDefaults.standard.array(forKey: "bookU")) as! [String]
        var authorArray = (UserDefaults.standard.array(forKey: "bookA")) as! [String]
        
        nameArray.append(book!)
        authorArray.append(author!)
        
        UserDefaults.standard.set(nameArray, forKey: "bookU")
        UserDefaults.standard.set(authorArray, forKey: "bookA")
        
        bookNameTextField.text = nil
        authorNameTextField.text = nil
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        bookNameTextField.resignFirstResponder()
        authorNameTextField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        bookNameTextField.resignFirstResponder()
        authorNameTextField.resignFirstResponder()
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
