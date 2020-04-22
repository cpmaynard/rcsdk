//
//  RCSDK.swift
//  RCSampleApp
//
//  Created by Apple on 22/04/20.
//  Copyright © 2020 Team. All rights reserved.
//

import UIKit

class RCSDK: NSObject {
    private static var instance: RCSDK!
    private var initiliazed = false
    private var apiKey: String?

    private override init() {
    }
    private init(apiKey:String) {
        self.apiKey = apiKey
    }
    class func setup(apiKey: String){
        if (instance == nil){
            instance = RCSDK(apiKey: apiKey)
        }
    }
    private class func validAPIKey()->Bool{
        if(instance != nil && instance.apiKey != nil && instance.apiKey == "abc123"){
            return true
        }else{
            NSLog("RCSDK: SDK is not intialized with valid APIKey.")
            return false
        }
    }
    public class func initiliazed()->Bool{
        if(validAPIKey()){
           return true
        }else{
            return false
        }
    }
}
