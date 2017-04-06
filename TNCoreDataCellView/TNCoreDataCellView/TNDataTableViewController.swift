//
//  TNDataTableViewController.swift
//  TNCoreDataCellView
//
//  Created by Prasobh Veluthakkal on 16/02/17.
//  Copyright © 2017 Focaloid. All rights reserved.
//

import UIKit
import CoreData
class TNDataTableViewController: UITableViewController {

    var people = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }
    override func viewWillAppear(animated: Bool) {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        //3
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            people = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TNDataTableViewCell

        let person = people[indexPath.row]
        
        cell.nameLabel.text = String(person.valueForKey("name")!)
        cell.ageLabel.text = String(person.valueForKey("age")!)
        cell.bloodLabel.text = String(person.valueForKey("blood")!)
        
        if let imageData = person.valueForKey("imageData") as? NSData
        {
        cell.image1.image = UIImage(data: imageData)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            people.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
