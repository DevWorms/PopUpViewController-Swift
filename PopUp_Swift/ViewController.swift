//
//  ViewController.swift
//  PopUp_Swift
//
//  Created by Emmanuel Valentín Granados López on 18/01/16.
//  Copyright © 2016 DevWorms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var popViewController : PopUpViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openPopUp(sender: AnyObject) {
        
        self.popViewController = storyboard!.instantiateViewControllerWithIdentifier("PopUpViewController") as! PopUpViewController
        self.popViewController.showInView( self.view, animated: true, scaleX: 0.72, scaleY: 0.72)
        
    }

}

