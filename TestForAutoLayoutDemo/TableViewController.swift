//
//  TableViewController.swift
//  TestForAutoLayoutDemo
//
//  Created by fei on 14-11-24.
//  Copyright (c) 2014年 self. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var testTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "列表页"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
        let bPoint:CGPoint = sender.convertPoint(CGPointZero, toView: testTableView)
        let index:NSIndexPath = testTableView.indexPathForRowAtPoint(bPoint)!
        
        self .tableView(testTableView, didSelectRowAtIndexPath: index)
       
//        let cell:UITableViewCell = 
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("reuseCell", forIndexPath: indexPath) as UITableViewCell
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let scccc = storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as SecondViewController
        let cell = testTableView.cellForRowAtIndexPath(indexPath)
        let btn = cell?.viewWithTag(100) as UIButton
        
        scccc.index = indexPath.row
        scccc.justForTest(btn)
        self.navigationController?.pushViewController(scccc, animated: true)
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
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
