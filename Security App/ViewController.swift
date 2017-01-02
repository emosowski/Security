//
//  ViewController.swift
//  Security App
//
//  Created by Emily on 11/8/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityScroll: UIPickerView!
    var cities = ["New York, NY", "Redwood City, CA"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }


}

