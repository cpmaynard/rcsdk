//
//  RCSDK.swift
//  RCSampleApp
//
//  Created by Apple on 22/04/20.
//  Copyright © 2020 Team. All rights reserved.
//

import UIKit

public final class RCSDK: NSObject {
    private static var instance: RCSDK!
    private var initiliazed = false

    private override init() {
    }
    public class func setup(apiKey: String){
        if (instance == nil){
            instance = RCSDK()
        }
    }
    private class func validSDK()->Bool{
        if(instance != nil){
            return true
        }else{
            NSLog("RCSDK: SDK is not intialized.")
            return false
        }
    }
    public class func initiliazed()->Bool{
        if(validSDK()){
           return true
        }else{
            return false
        }
    }
}
