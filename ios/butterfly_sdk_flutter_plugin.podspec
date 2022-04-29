#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint butterfly_sdk_flutter_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'butterfly_sdk_flutter_plugin'
  s.version          = '1.1.0'
  s.summary          = 'A plugin for The Butterfly SDK (iOS) that allows you use it in yout Flutter mobile app.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/TheButterflySDK/About'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'The Butterfly SDK' => 'perrchick@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'TheButterflySDK', '1.1.0'
  s.platform = :ios, '9.0'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
