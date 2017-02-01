//
//  AlertsTableViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 1/31/17.
//  Copyright © 2017 emilyosowski. All rights reserved.
//

import UIKit

class AlertsTableViewController: UITableViewController {
    
    
    let APP_ID = "D55FE643-9856-08BB-FFC4-163728F3F400"
    let SECRET_KEY = "1302ECDA-6678-F016-FF86-D01C9E33EC00"
    let VERSION_NUM = "v1"
    
    
    
    var backendless = Backendless.sharedInstance()
    var alerts: [Alert]! = []
    var error: Fault?
    

    
//    @IBOutlet weak var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backendless?.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)

        self.loadData()
        findHousesUserIsIn()
        
//        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        self.table.dataSource = self
//        self.table.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func findHousesUserIsIn() {
        
//        self.backendless.userService.getPersistentUser()
//        let user = self.backendless.userService.currentUser
//        
        
//        let whereClause = "UsersInHouse.objectId = '\(user.objectId)'"
        let dataQuery = BackendlessDataQuery()
//        dataQuery.whereClause = whereClause
        
        
        let alertObjects = (self.backendless?.persistenceService.of(Alert.ofClass()).find(dataQuery))! as BackendlessCollection
        
        
        if error == nil {
            self.alerts.append(contentsOf: alertObjects.data as! [Alert]!)
            for alert in alertObjects.data as! [Alert] {
                print(alert.AlertBody)
                print(alerts)
                
            }
            
        }
        else {
            print("Server reported an error: \(error)")
        }
    }
    
    func loadData() {
        var alerts: [Alert]! = []
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alerts.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "houseCell") as! HousesCell
        cell.bindData(alert: self.alerts[indexPath.row])
        
        // Configure the cell...
        
        print("made it to here")
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let alert = self.alerts[indexPath.row]
        let alertId = alert.objectId! as String
        print(alertId)
        
    }
    
}


