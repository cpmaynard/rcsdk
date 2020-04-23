//
//  RCJSWidgetView.swift
//  RCSampleApp
//
//  Created by Apple on 22/04/20.
//  Copyright © 2020 Team. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore


private let baseURL = "https://assets.revcontent.com/master"
private let widgetHostKey = "{widget-host}"
private let widgetHostVal = "habitat"
private let endPointKey = "{endpoint}"
private let endPointVal = "trends.revcontent.com"
private let isSecuredKey = "{is-secured}"
private let isSecuredVal = "true"
private let jsSrcKey = "{js-src}"
private let jsSrcVal = "https://assets.revcontent.com/master/delivery.js"
private let deferKey = "{defer}"
private let deferVal = "defer"
private let widgetIdKey = "{widget-id}"
private let widgetSubIdKey = "{sub-ids}"


class RCJSWidgetView: WKWebView {
    private var htmlWidget:String?
    private var widgetId:String?
    private var widgetSubId:[String:String]?
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        self.navigationDelegate = self
        self.loadHTMLContent()
    }
    private func loadHTMLContent(){
        let htmlPath = Bundle.main.path(forResource: "widget", ofType: "html")
        do {
            self.htmlWidget = try String.init(contentsOfFile: htmlPath!, encoding: .utf8)
        } catch {
            print(error)
            self.htmlWidget = nil
        }
    }
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWidgetId(widgetId:String){
        self.widgetId = widgetId
    }
    func setWidgetSubId(widgetSubId:[String:String]){
        self.widgetSubId = widgetSubId
    }
    func setWidgetId(widgetId:String, widgetSubId:[String:String]){
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
        var result = self.htmlWidget!.replacingOccurrences(of: widgetHostKey, with: widgetHostVal)
        result = result.replacingOccurrences(of: endPointKey, with: endPointVal)
        result = result.replacingOccurrences(of: isSecuredKey, with: isSecuredVal)
        result = result.replacingOccurrences(of: widgetIdKey, with: self.widgetId!)
        result = result.replacingOccurrences(of: jsSrcKey, with: jsSrcVal)
        result = result.replacingOccurrences(of: deferKey, with: deferVal)
        if(self.widgetSubId != nil){
            let jsonData = try? JSONSerialization.data(withJSONObject: self.widgetSubId!, options: [])
            let jsonString = String(data: jsonData!, encoding: .utf8)
            result = result.replacingOccurrences(of: widgetSubIdKey, with: jsonString!)
        }
        return result
    }
}

extension RCJSWidgetView: WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
           if navigationAction.navigationType == .linkActivated {
               guard let url = navigationAction.request.url else {
                   decisionHandler(.allow)
                   return
               }
               let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
               if components?.scheme == "http" || components?.scheme == "https"
               {
                   UIApplication.shared.open(url)
                   decisionHandler(.cancel)
               } else {
                   decisionHandler(.allow)
               }
           } else {
               decisionHandler(.allow)
           }
       }
}
