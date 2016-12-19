//
//  EvacuationController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 12/12/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit

class EvacuationController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pdf = Bundle.main.url(forResource: "NYEvacPlan", withExtension: "pdf", subdirectory: nil, localization: nil)  {
                let req = NSURLRequest(url: pdf)
                let webView = UIWebView(frame: CGRect(0,60,self.view.frame.size.width-0,self.view.frame.size.height-60))
                webView.loadRequest(req as URLRequest)
                self.view.addSubview(webView)
                webView.scalesPageToFit = true
                // allow pinch zoom
            }
    
        
        }
    
    

}
