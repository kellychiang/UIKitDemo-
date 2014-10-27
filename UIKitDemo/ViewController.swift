//
//  ViewController.swift
//  UIKitDemo
//
//  Created by kelly on 2014/10/24.
//  Copyright (c) 2014年 kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate{
    @IBOutlet weak var tableview: UITableView! = UITableView ()

    var dataSource: NSMutableArray = NSMutableArray ()
    var headerView: UIView = UIView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.delegate = self
        tableview.dataSource = self
        
        headerView.frame = CGRectMake(0, 0, 320, 200)
        headerView.backgroundColor = UIColor.blackColor()
        
        tableview.tableHeaderView = headerView
        
        var nameTextField: UITextField = UITextField(frame: CGRectMake(0, 0, 145 , 45))
        nameTextField.center = headerView.center
        nameTextField.backgroundColor = UIColor.whiteColor()
        nameTextField.textAlignment = NSTextAlignment.Center
        nameTextField.placeholder = "Enter your name"
        nameTextField.delegate = self
        
        headerView .addSubview(nameTextField)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"Cell")
        
        cell.textLabel.text = "Hello \(dataSource.objectAtIndex(indexPath.row) as String)"

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var alert: UIAlertController = UIAlertController(title: "Message", message: "Thanks for clicking", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close AlertView", style: UIAlertActionStyle.Default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Change header color", style: UIAlertActionStyle.Default, handler: { alertAction in
            UIView.animateWithDuration(2.5, animations: {self.headerView.backgroundColor = UIColor.blueColor()}, completion: {_ in  println("Animation complete")})
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        dataSource.addObject(textField.text as String)
        tableview.reloadData()
        
        textField.text = ""
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

