//
//  OptionsViewController.swift
//  Can I do this?
//
//  Created by Alecs Popa on 08/09/14.
//  Copyright (c) 2014 Alecs Popa. All rights reserved.
//

import UIKit

class OptionsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.set("screenName", value: "Options View")
        tracker.send(GAIDictionaryBuilder.createAppView().build())
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // make table rows same height
        return (UIScreen.mainScreen().bounds.height) / 4
    }
    
    @IBAction func optionTouchAction(sender: UIButton) {
        // send action to GA
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.set("screenName", value: "Options View")
        tracker.send(GAIDictionaryBuilder.createEventWithCategory("UX", action: "touch", label: sender.titleLabel?.text, value: nil).build())
        tracker.set("screenName", value: nil)
        
        // open response view controller
        let responseView = storyboard?.instantiateViewControllerWithIdentifier("responseViewController") as ResponseViewController
        responseView.view.backgroundColor = sender.superview?.backgroundColor // set response view background color as the one on the content view where this button is
        self.presentViewController(responseView, animated: true, completion: nil)
    }
    
}

