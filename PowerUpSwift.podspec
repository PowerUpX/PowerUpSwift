#
# Be sure to run `pod lib lint PowerUpSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PowerUpSwift'
  s.version          = '1.0.2'
  s.summary          = 'Make iOS Development faster and become more productive.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Apple doesn't provide some basic useful utilities to make our iOS Development lives a little easier. This might be for a [good] reason, such as keeping the platform lightweight. It sometimes requires extra time and effort to implement a simple basic feature that you can easily do in Android built-in, so you end up doing a couple more hacks. This library was created to save time, to be more productive, and to be DRY (Don't Repeat Yourself)."

  s.homepage         = 'https://github.com/PowerUpX/PowerUpSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ceferino Jose II' => 'cefjoeii@gmail.com' }
  s.source           = { :git => 'https://github.com/PowerUpX/PowerUpSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'PowerUpSwift/Classes/**/*'
  s.swift_version = '5.0'
  
  # s.resource_bundles = {
  #   'PowerUpSwift' => ['PowerUpSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
