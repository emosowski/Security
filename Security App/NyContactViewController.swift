//
//  NyContactViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 12/5/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit

class NyContactViewController: UIViewController {

    @IBAction func HelpDeskCall(_ sender: Any) {
        
        let number = URL(string: "telprompt://5129499336")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    
    }
    @IBAction func SOScall(_ sender: Any) {
        let number = URL(string: "telprompt://123456789")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    @IBAction func helpDeskCall(_ sender: Any) {
        let number = URL(string: "telprompt://123456789")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    @IBAction func evacuationPlan(_ sender: Any) {
        let number = URL(string: "telprompt://123456789")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
