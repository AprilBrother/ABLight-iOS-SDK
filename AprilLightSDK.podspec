Pod::Spec.new do |s|
  s.name         = "AprilLightSDK"
  s.version      = "1.0.0"
  s.summary      = "April Light SDK for iOS, use this library communicate with April lights.”
  s.homepage     = "https://github.com/AprilBrother/ABLight-iOS-SDK"
  s.author       = { "AprilBrother" => "tech@aprbrother.com" }
  s.platform     = :ios
  s.ios.deployment_target = '7.0'
  s.source       = { :git => "https://github.com/AprilBrother/ABLight-iOS-SDK.git", :tag => s.version.to_s }
  s.source_files  = 'ABLightSDK/Headers/*.{h}'
  s.preserve_paths = 'ABLightSDK/libABLightSDK.a'
  s.vendored_libraries = 'AprilSDK/libABLightSDK.a'
  s.requires_arc = true
  s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/ABLightSDK' }
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2013 AprilBrother LLC, Inc. All rights reserved.
      LICENSE
  }
end
