//
//  ViewController.swift
//  TestForAutoLayoutDemo
//
//  Created by fei on 14-11-24.
//  Copyright (c) 2014年 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var button = UIButton()
        button.addTarget(self, action:"buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        self.testImageView.userInteractionEnabled = true;
        let tapOne = UITapGestureRecognizer()
        tapOne.addTarget(self, action:"tapGesture:")
        tapOne.numberOfTapsRequired = 1;
        self.testImageView.addGestureRecognizer(tapOne)
        
        let tapTwo = UITapGestureRecognizer(target: self, action: "tapTwiceGesture:")
        tapTwo.numberOfTapsRequired = 2;
        
        self.testImageView.addGestureRecognizer(tapTwo)
        
        tapOne.requireGestureRecognizerToFail(tapTwo)
        
        
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet var testImageView: UIImageView!
    
    func tapGesture(tapG:UITapGestureRecognizer) {
        println("tap once")
    }
    func tapTwiceGesture(tapT:UITapGestureRecognizer) {
        println("twice")
    }
    
    func buttonClicked(button:UIButton) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

