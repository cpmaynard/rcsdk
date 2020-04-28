Pod::Spec.new do |spec|

  spec.name         = "iOSRevContentSDK"
  spec.version      = "0.0.8"
  spec.summary      = "A CocoaPods library for Revcontent written in Swift."
  spec.description  = <<-DESC
                   This cocoapods library enables you to receive the same ad fill you would see in our traditional ad placements in a more flexible format
                   DESC
  spec.homepage     = "https://github.com/cpmaynard/rcsdk"
  spec.license      = { :type => "MIT", :file => "../LICENSE" }
  spec.author             = { "Chris Maynard" => "chris@revcontent.com" }
  spec.ios.deployment_target = "10.0"
  spec.swift_version = "5.0"
  


  spec.source       = { :git => "https://github.com/cpmaynard/rcsdk.git", :tag => "#{spec.version}" }
  spec.source_files  = "RCSDK/**/*.{h,m,swift}"

end
