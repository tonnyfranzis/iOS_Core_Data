//
//  ViewController.swift
//  TNCoreDataCellView
//
//  Created by Prasobh Veluthakkal on 16/02/17.
//  Copyright © 2017 Focaloid. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var ageText: UITextField!
    
    @IBOutlet weak var bloodText: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
       var names = [String]()
    
    let imagePicker = UIImagePickerController()
    //    var ages = [Double]()
    //    var blood = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate=self
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func saveName(name: String,age : Int,blood : String,imageArgument : UIImage) {
        //1
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Person",
                                                        inManagedObjectContext:managedContext)
        
        let person = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
        let imageData = NSData(data: UIImageJPEGRepresentation(imageArgument, 1.0)!)
        //3
        person.setValue(name,forKey: "name")
        person.setValue(age, forKey: "age")
        person.setValue(blood, forKey: "blood")
      person.setValue(imageData, forKey: "imageData")
        
        //4
        do {
            try managedContext.save()
            //5
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

        let control = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tableView") as!TNDataTableViewController
        
        navigationController?.pushViewController(control, animated: true)

}

    @IBAction func save(sender: AnyObject) {
      
    self.saveName(nameText.text!, age: Int(ageText.text!)!, blood: bloodText.text!,imageArgument:  imageView.image!)
    }
//image picker
    @IBAction func imagePicker(sender: AnyObject) {
       
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil);

        

      
    }
    
}

