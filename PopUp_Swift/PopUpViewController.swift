//
//  PopUpViewController.swift
//  PopUp_Swift
//
//  Created by Emmanuel Valentín Granados López on 18/01/16.
//  Copyright © 2016 DevWorms. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var popTransparentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //PopUp
        self.view.layer.cornerRadius = 5
        self.view.layer.shadowOpacity = 0.8
        self.view.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.view.layer.masksToBounds = true
        self.view.layer.zPosition = 1;
        
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
    
    func showInView(aView: UIView!, animated: Bool, scaleX: CGFloat, scaleY: CGFloat) {
        
        self.popTransparentView = UIView.init(frame:  aView.frame)
        self.popTransparentView.backgroundColor = UIColor(white: 0.5, alpha: 0.6)
        
        aView.addSubview( self.popTransparentView )
        aView.addSubview(self.view)
        
        if animated {
            
            self.showAnimate(scaleX, sY: scaleY)
        }
    }
    
    func showAnimate(sX: CGFloat, sY: CGFloat) {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(sX, sY)
        });
    }
    
    func removeAnimate() {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished) {
                    
                    self.view.removeFromSuperview()
                    self.popTransparentView.removeFromSuperview()
                }
        });
    }

    @IBAction func closePopUp(sender: AnyObject) {
        
         self.removeAnimate()
    }
    
}
