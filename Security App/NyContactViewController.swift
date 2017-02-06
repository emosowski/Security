//
//  NyContactViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 12/5/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit
import MessageUI

class NyContactViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    


    @IBAction func officeCall(_ sender: Any) {
        
        let number = URL(string: "telprompt://6469192886")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    
    @IBAction func sosCall(_ sender: Any) {
        
        let number = URL(string: "telprompt://40402087628021")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    @IBAction func helpDeskCall(_ sender: Any) {
        
        let number = URL(string: "telprompt://18667729350")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    @IBAction func helpDeskEmail(_ sender: Any) {
        
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients(["emily.osowski@vodafone.com"])
        mailVC.setSubject("")
        mailVC.setMessageBody("", isHTML: false)
        
        present(mailVC, animated: true, completion: nil)
        
    }

    @IBAction func cwtCall(_ sender: Any) {
        
        let number = URL(string: "telprompt://8002535095")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }

    
    @IBAction func evacuationPlan(_ sender: Any) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Title"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }

    


}
