//
//  ViewController.swift
//  RCSampleApp
//
//  Created by Apple on 22/04/20.
//  Copyright © 2020 Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var widget:RCJSWidgetView?
    override func viewDidLoad() {
        super.viewDidLoad()
        RCSDK.setup(apiKey: "abc123")
        self.widget = RCJSWidgetView.init(frame: CGRect.init(x: 0.0, y: 270, width: self.view.frame.size.width, height: self.view.frame.size.height-270))
        let subIds = ["category":"BBQ","utm_code":"123456"]
        self.widget!.setWidgetId(widgetId: "66620")
        self.widget!.setWidgetSubId(widgetSubId:subIds)
        self.widget!.loadWidget()
        self.view.addSubview(self.widget!)
    }
    @IBAction func actionBackButton(sender: UIButton) {
        self.widget!.loadWidget()
    }
}

