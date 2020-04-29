//
//  ViewController.swift
//  RCSDKExamples
//
//  Created by Apple on 24/04/20.
//  Copyright © 2020 Revcontent. All rights reserved.
//

import UIKit
import RCSDK
class ViewController: UIViewController {
        
       override func viewDidLoad() {
            RCSDK.setup()
            let widget = RCJSWidgetView.init(frame: self.view.frame)
            widget.setWidgetId(widgetId: "66620")
            widget.setWidgetSubId(widgetSubId:["category":"entertainment", "utm_code":"123456"]);  // It is Optional
         //   widget.setWidgetSubId(widgetId:"66620", widgetSubId:["category":"entertainment", "utm_code":"123456"]);  // You can also use this way.
            widget.loadWidget()
            self.view.addSubview(widget)
       }
      

}

