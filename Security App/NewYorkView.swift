//
//  NewYorkView.swift
//  Security App
//
//  Created by Emily on 12/28/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit

class NewYorkView: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

}
