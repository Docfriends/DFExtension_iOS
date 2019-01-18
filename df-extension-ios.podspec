#
# Be sure to run `pod lib lint df-extension-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'df-extension-ios'
  s.version          = '0.1.3'
  s.summary          = '닥프렌즈의 기본 extension 라이브러리'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
여러 UIKIt, Foundation의 클래스를 extension으로 필요한 프로퍼티와 메서드를 구현해놓은 라이브러리
                       DESC

  s.homepage         = 'https://github.com/Docfriends-Dev/df-extension-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Docfriends' => 'apps@docfriends.com' }
  s.source           = { :git => 'https://github.com/Docfriends-Dev/df-extension-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'df-extension-ios/Classes/**/*'
  
  s.swift_version = '4.2'
  
  # s.resource_bundles = {
  #   'df-extension-ios' => ['df-extension-ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
