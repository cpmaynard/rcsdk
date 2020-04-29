//
//  ViewController.swift
//  RCSDKExample
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 Revcontent. All rights reserved.
//

import UIKit
import RCSDK
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RCSDK.setup()
        let widget = RCJSWidgetView.init(frame: self.view.frame)
        widget.setWidgetId(widgetId: "66620")
        widget.setWidgetSubId(widgetSubId:["category":"entertainment", "utm_code":"123456"]); 
        widget.loadWidget()
        self.view.addSubview(widget)
        // Do any additional setup after loading the view.
    }
    
    
}

