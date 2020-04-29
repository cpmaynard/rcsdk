# Introduction:
The Revcontent iOS SDK enables you to receive the same ad fill you would see in our traditional ad placements in a more flexible format.
# Prerequisites
- XCode Version >= 10.x
- iOS Version >=10.0
# Features
- Load widget by WidgetId
- Load widget by SubId (Optional)
- Flexible widget size
- Add widget programmatically or by creating IBOutlets from Storyboard/Xibs.
# Installation
- Download or Clone iOS Universal framework `RCSDK.framework`.
- Drag & Drop `RCSDK.framework` in your iOS application project.
- In Build phases make sure it is showing in `Embedded Frameworks` and `Copy Sign On Copy` is selected.

# Example Project
- You can also play with SDK in RCSDKExample project.

# Usage
```
import RCSDK
RCSDK.setup()
let widget = RCJSWidgetView.init(frame: self.view.frame)
widget.setWidgetId(widgetId: "66620")  // for e.g. "66620"
widget.setWidgetSubId(widgetSubId:["category":"entertainment", "utm_code":"123456"])
// widget.setWidgetSubId(widgetId:"66620", widgetSubId:["category":"entertainment", "utm_code":"123456"]);  // You can also use this way.
widget.loadWidget()
self.view.addSubview(widget)
```
# License
MIT


