//
//  IssuedBooksTableViewController.swift
//  LibraryApp
//
//  Created by Lalli Mann on 07/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit

class IssuedBooksTableViewController: UITableViewController {

    
    var userNameIssued: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let user = userNameIssued
        return UserDefaults.standard.array(forKey: "issuedBookName"+user)!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = userNameIssued
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "allBookCell", for: indexPath)
            as? AllBooksTableViewCell{
//
//            let nameArray = UserDefaults.standard.array(forKey: "bookU")
//            let authorArray = UserDefaults.standard.array(forKey: "bookA")
//
            var issuedNameArray = UserDefaults.standard.array(forKey: "issuedBookName"+user)
            var issuedAuthorArray = UserDefaults.standard.array(forKey: "issuedBookAuthor"+user)
            
            
            
            if(issuedAuthorArray?.isEmpty)!
            {
                tableView.numberOfRows(inSection: 0)
            }
            else
            {
                print("issuedBookName"+user)
                cell.bookNameLable.text = String(describing: issuedNameArray![indexPath.row])
                cell.bookAuthorLable.text = String(describing: issuedAuthorArray![indexPath.row])
            }
            return cell
            
        }
        else
        {
            fatalError("error")
        }
        
        // Configure the cell...
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Return this book", message: "Chooese yes to return or cancel to dismiss", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            
            let user = self.userNameIssued as String
            
            let indexPath = tableView.indexPathForSelectedRow
            
            //getting the current cell from the index path
            let currentCell = tableView.cellForRow(at: indexPath!)! as! AllBooksTableViewCell
            
            var issuedNameArray = UserDefaults.standard.array(forKey: "issuedBookName"+user) as! [String]
            var issuedAuthorArray = UserDefaults.standard.array(forKey: "issuedBookAuthor"+user) as! [String]
            
            var nameArray = UserDefaults.standard.array(forKey: "bookU") as! [String]
            var authorArray = UserDefaults.standard.array(forKey: "bookA") as! [String]
            
            nameArray.append(currentCell.bookNameLable.text!)
            authorArray.append(currentCell.bookAuthorLable.text!)
            
            UserDefaults.standard.set(nameArray, forKey: "bookU")
            UserDefaults.standard.set(authorArray, forKey: "bookA")
            
            
            issuedNameArray.remove(at: (indexPath?.row)!)
            issuedAuthorArray.remove(at: (indexPath?.row)!)
            
            UserDefaults.standard.set(issuedNameArray, forKey: "issuedBookName"+user)
            UserDefaults.standard.set(issuedAuthorArray, forKey: "issuedBookAuthor"+user)
            
            
            
            tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
  
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
