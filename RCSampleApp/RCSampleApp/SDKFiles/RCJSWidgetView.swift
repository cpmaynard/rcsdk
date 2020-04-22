//
//  RCJSWidgetView.swift
//  RCSampleApp
//
//  Created by Apple on 22/04/20.
//  Copyright © 2020 Team. All rights reserved.
//

import UIKit
import WebKit
class RCJSWidgetView: WKWebView {
    private var htmlWidget:String?
    private let baseURL = "https://assets.revcontent.com/master"
    private var widgetId:String?
    private var widgetSubId:[String:Any]?
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        self.loadHTMLContent()
    }
   
    private func loadHTMLContent(){
        let htmlPath = Bundle.main.path(forResource: "widget", ofType: "html")
        do {
            self.htmlWidget = try String.init(contentsOfFile: htmlPath!, encoding: .utf8)
        } catch {
            self.htmlWidget = nil
        }
    }
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWidgetId(widgetId:String){
        self.backgroundColor = .red
        self.widgetId = widgetId
    }
    func setWidgetId(widgetId:String, widgetSubId:[String:Any]){
        self.widgetId = widgetId
        self.widgetSubId = widgetSubId
    }
    func loadWidget(){
        if(RCSDK.initiliazed()){
            if (self.htmlWidget != nil){
                if (self.widgetId != nil){
                    let html = self.generateWidgetHTML();
                    self.loadHTMLString(html, baseURL: URL.init(string: baseURL))
                }else{
                    NSLog("RCSDK -> RCJSWidgetView: WidgetId is required.")
                }
            }else{
                NSLog("RCSDK -> RCJSWidgetView: Widget not loaded.")
            }
        }
    }
    
    private func generateWidgetHTML()->String{
        var result = self.htmlWidget!.replacingOccurrences(of: "{widget-host}", with: "habitat")
        result = result.replacingOccurrences(of: "{endpoint}", with: "trends.revcontent.com")
        result = result.replacingOccurrences(of: "{is-secured}", with: "true")
        result = result.replacingOccurrences(of: "{widget-id}", with: self.widgetId!)
        result = result.replacingOccurrences(of: "{js-src}", with: "https://assets.revcontent.com/master/delivery.js")
        result = result.replacingOccurrences(of: "{defer}", with: "defer")
        return result
    }
}
