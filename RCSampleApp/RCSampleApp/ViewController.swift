//
//  ViewController.swift
//  RCSampleApp
//
//  Created by Apple on 22/04/20.
//  Copyright © 2020 Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RCSDK.setup(apiKey: "abc123")
        let widget = RCJSWidgetView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        let subIds = ["category":"entertainment"]
        widget.setWidgetId(widgetId: "114858", widgetSubId: subIds)
        widget.loadWidget()
        self.view.addSubview(widget)
        
        // Do any additional setup after loading the view.
    }
    


}

