//
//  ResponseViewController.swift
//  Can I do this?
//
//  Created by Alecs Popa on 09/09/14.
//  Copyright (c) 2014 Alecs Popa. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultLabel.text = (arc4random() % 2 == 0 ? NSLocalizedString("RESPONSE_YES", comment: "Yes") : NSLocalizedString("RESPONSE_NO", comment: "No"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.set("screenName", value: "Response View")
        tracker.send(GAIDictionaryBuilder.createAppView().build())
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
