//
//  SecondViewController.swift
//  TestForAutoLayoutDemo
//
//  Created by fei on 14-11-24.
//  Copyright (c) 2014年 self. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIActionSheetDelegate,UIAlertViewDelegate {
    var index:Int = 0
    override func viewDidLoad() {
        var dataArray:NSMutableArray
        super.viewDidLoad()
        self.title = "第二页"
        self.automaticallyAdjustsScrollViewInsets = false
        println("\(index)")
        let bwidth:CGFloat = self.view.frame.size.width/9
        let bheight:CGFloat = (self.view.frame.size.height-64)/9
        let colorArr = [UIColor.redColor(),UIColor.yellowColor(),UIColor.purpleColor(),UIColor.brownColor(),UIColor.orangeColor(),UIColor.blackColor(),UIColor.blackColor(),UIColor.purpleColor(),UIColor.lightGrayColor()]
        for var i:CGFloat=0;i<9;i++ {
            for var j:CGFloat=0;j<9;j++ {
                let button = UIButton()
                button.frame = CGRectMake(bwidth*j, 64+bheight*i, bwidth-2, bheight-2)
                button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
                button.tag = 100+Int(i)*9+Int(j);
                let selectInt = Int(arc4random()%8)
                
                button.backgroundColor=colorArr[selectInt]
                button.setTitle(String("\(button.tag-100)"), forState: UIControlState.Normal)
                self.view.addSubview(button)
                button.clipsToBounds = true;
                button.layer.cornerRadius=2.0
                button.layer.borderColor = UIColor.purpleColor().CGColor
                button.layer.borderWidth = 1
            }
            
        }
        
    }
    func buttonClicked(sender:UIButton) {
        if sender.tag%2==0 {
            let alert = UIAlertView(title: "noti", message: "just for test ^V^", delegate: self, cancelButtonTitle: "cancel", otherButtonTitles: "sure")
            alert.show()
        } else {
            let actionSheet = UIActionSheet(title: "selection", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: "destructive", otherButtonTitles: "back", "sure")
            actionSheet.showInView(self.view)
        }
    }
    //UIAlerViewDelegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        println("alertview select index :\(buttonIndex)")
    }
    //UIActionSheetDelegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        println("actionsheet select index :\(buttonIndex)")
    }
    func justForTest(sender:UIButton) {
        println("second vc clicked :\(sender.tag)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
