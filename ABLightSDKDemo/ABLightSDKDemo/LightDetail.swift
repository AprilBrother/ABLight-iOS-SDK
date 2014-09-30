//
//  LightDetail.swift
//  Example
//
//  Created by liaojinhua on 14-9-19.
//  Copyright (c) 2014年 AprilBrother. All rights reserved.
//

import UIKit

class LightDetalViewController : UIViewController, ABLightDelegate {
    
    @IBOutlet weak var lightValueSlide: UISlider!
    var light:ABLight?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        light?.delegate = self
        self.title = light?.peripheral.name
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        light?.connect()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        light?.disconnect()
    }
    
    @IBAction func slideValueChanged(sender: UISlider) {
        light?.setLightValue(Int(sender.value), withCompletion: { (error:NSError?) -> Void in
            println("write \(Int(sender.value)) success")
        })
    }
    // ABLightDelegate
    func lightDidConnected(light: ABLight!, withError error: NSError?) {
        if let err = error {
            return
        }
        lightValueSlide.value = Float(light.currentLight)
        lightValueSlide.enabled = true
    }
    
    func lightDidDisconnected(light: ABLight!, withError error: NSError?) {
        
    }
}
