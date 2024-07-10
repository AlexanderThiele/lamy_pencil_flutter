#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint lamy_pencil_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'lamy_pencil_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Flutter Wrapper for Lamy iPadOS SDK'
  s.description      = <<-DESC
Flutter Wrapper for Lamy iPadOS SDK
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*', 'Frameworks/LamySDK.xcframework/ios-arm64/**/*'
  s.dependency 'Flutter'
  s.frameworks  = 'CoreBluetooth', 'SystemConfiguration', 'CoreMotion'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386', 'OTHER_LDFLAGS' => '-ObjC' }
  s.swift_version = '5.0'

  s.vendored_frameworks = 'Frameworks/LamySDK.xcframework'
end
