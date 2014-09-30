//
//  ViewController.swift
//  Example
//
//  Created by liaojinhua on 14-9-18.
//  Copyright (c) 2014年 AprilBrother. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, ABLightManagerDelegate {
    
    var lightArray = NSMutableArray();
    var lightManager = ABLightManager();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lightManager.delegate = self
        lightManager.startDiscoverLight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowLight" {
            var vc = segue.destinationViewController as LightDetalViewController
            vc.light = sender as? ABLight
        }
    }
    
    @IBAction func startRefresh(sender: AnyObject) {
        lightManager.stopDiscoverLight()
        lightManager.startDiscoverLight()
    }
    // UITableViewDelegate, UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lightArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("LightCell", forIndexPath: indexPath) as UITableViewCell
        let light = lightArray.objectAtIndex(indexPath.row) as ABLight
        cell.textLabel?.text = light.peripheral.name
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ShowLight", sender: lightArray.objectAtIndex(indexPath.row))
    }
    
    //ABLightManagerDelegate method
    func lightManager(manager:ABLightManager, didDiscoverLights lights:NSArray) {
        self.refreshControl?.endRefreshing()
        lightArray.removeAllObjects()
        lightArray.addObjectsFromArray(lights)
        self.tableView.reloadData()
    }

}

