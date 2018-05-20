//
//  IssueBookTableViewController.swift
//  LibraryApp
//
//  Created by Lalli Mann on 06/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit

class IssueBookTableViewController: UITableViewController {

    var userNameHome: String = ""
    
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
        return UserDefaults.standard.array(forKey: "bookU")!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "allBookCell", for: indexPath)
            as? AllBooksTableViewCell{
            let nameArray = UserDefaults.standard.array(forKey: "bookU")
            let authorArray = UserDefaults.standard.array(forKey: "bookA")
            
            
            cell.bookNameLable.text = String(describing: nameArray![indexPath.row])
            cell.bookAuthorLable.text = String(describing: authorArray![indexPath.row])
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
    
        
        let user = userNameHome as String
        
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as! AllBooksTableViewCell
        
        var issuedNameArray = UserDefaults.standard.array(forKey: "issuedBookName"+user) as! [String]
        var issuedAuthorArray = UserDefaults.standard.array(forKey: "issuedBookAuthor"+user) as! [String]
        
        issuedNameArray.append(currentCell.bookNameLable.text!)
        issuedAuthorArray.append(currentCell.bookAuthorLable.text!)
        
        UserDefaults.standard.set(issuedNameArray, forKey: "issuedBookName"+user)
        UserDefaults.standard.set(issuedAuthorArray, forKey: "issuedBookAuthor"+user)
        
        var nameArray = UserDefaults.standard.array(forKey: "bookU") as! [String]
        var authorArray = UserDefaults.standard.array(forKey: "bookA") as! [String]
        
        
        nameArray.remove(at: (indexPath?.row)!)
        authorArray.remove(at: (indexPath?.row)!)
        
        UserDefaults.standard.set(nameArray, forKey: "bookU")
        UserDefaults.standard.set(authorArray, forKey: "bookA")
        
        
        let alert = UIAlertController(title: "Done", message: "\(currentCell.bookNameLable.text!) issued", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")}))
       
        self.present(alert, animated: true, completion: nil)
        
        
        
        tableView.reloadData()
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      
        
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
