#
#  Be sure to run `pod spec lint wxxsdk.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
 


s.name              = "umvideosdk"
s.version           = "4.1.0"
s.summary           = "有米广告iOS视频sdk"
 

s.homepage          = "https://github.com/youmi/ios-sdk"
     
s.license           = { :type => "MIT", :file => "LICENSE" }

s.platform          = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.author              = { "umplus" => "sdk@youmi.net" }
   

s.source            = { :git => "https://github.com/youmi/ios-sdk.git", :tag => "#{s.version}" }
s.source_files      = 'lib/**/*.{h,m}'
s.resource          = "lib/UMVideo.bundle"
s.preserve_paths    = "lib/libUMVideoSDK.a"

s.frameworks = 'CoreImage', 'WebKit', 'Security', 'SystemConfiguration', 'UIKit','CFNetwork','MediaPlayer','StoreKit','CoreMotion','AudioToolbox','AdSupport','CoreTelephony'

s.library = 'z','sqlite3','icucore'
  
end