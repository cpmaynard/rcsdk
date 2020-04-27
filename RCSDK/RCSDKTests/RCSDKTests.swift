//
//  RCSDKTests.swift
//  RCSDKTests
//
//  Created by Apple on 24/04/20.
//  Copyright © 2020 Revcontent. All rights reserved.
//

import XCTest
@testable import RCSDK

class RCSDKTests: XCTestCase {

    override func setUp() {
        RCSDK.setup()
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
       let widget = RCJSWidgetView.init(frame: CGRect.init(x: 0.0, y: 270, width: 100, height: 100))
       let subIds = ["category":"BBQ","utm_code":"123456"]
       widget.setWidgetId(widgetId: "66620")
       widget.setWidgetSubId(widgetSubId:subIds)
       widget.setSiteUrl(siteUrl: "http://rcsampleapp.com/")
       widget.loadWidget()
    }
}
