//
//  PopUpViewController.swift
//  PopUp_Swift
//
//  Created by Emmanuel Valentín Granados López on 18/01/16.
//  Copyright © 2016 DevWorms. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var aView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.layer.cornerRadius = 5
        self.view.layer.shadowOpacity = 0.8
        self.view.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "panGestureHandler:")
        self.view.addGestureRecognizer(panGestureRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func panGestureHandler(sender:UIPanGestureRecognizer){
        self.removeAnimate()
    }
    
    func showInView(aView: UIView!, animated: Bool) {
        
        self.aView = aView
        
        self.aView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        self.aView.addSubview(self.view)
        
        if animated {
            
            self.showAnimate()
        }
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(0.8, 0.8)
        });
    }
    
    func removeAnimate() {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished) {
                    
                    self.aView.backgroundColor = UIColor(white: 1, alpha: 1)
                    self.view.removeFromSuperview()
                }
        });
    }

    @IBAction func closePopUp(sender: AnyObject) {
        
         self.removeAnimate()
    }
    
}
