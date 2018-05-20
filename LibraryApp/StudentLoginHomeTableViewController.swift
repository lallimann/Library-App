//
//  StudentLoginHomeTableViewController.swift
//  LibraryApp
//
//  Created by Lalli Mann on 04/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit

class StudentLoginHomeTableViewController: UITableViewController {

    var usernameLogin: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = usernameLogin as String
        
        print(usernameLogin)
        
        navigationItem.hidesBackButton = true;
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore3"+user)
        
        if launchedBefore  {
            print("Not first launch3.")
        }
        else {
            
            let stuIssuedBooksName:[String] = []
            let stuIssuedBooksAuthorName:[String] = []
            
            
            UserDefaults.standard.set(true, forKey: "launchedBefore3"+user)
            
            
            
            print(user+"FirstLaunch")
            
            UserDefaults.standard.set(stuIssuedBooksName, forKey: "issuedBookName"+user)
            UserDefaults.standard.set(stuIssuedBooksAuthorName, forKey: "issuedBookAuthor"+user)
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "issueBook")
        {
            let scndViewController = segue.destination as? IssueBookTableViewController
            let username =  usernameLogin
            scndViewController?.userNameHome = username
        }
        
        if (segue.identifier == "issued")
        {
            let scndViewCntrlr = segue.destination as? IssuedBooksTableViewController
            scndViewCntrlr?.userNameIssued =  usernameLogin
        }
        
    }
    
    // MARK: - Table view data source

    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
