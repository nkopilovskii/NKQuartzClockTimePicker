#
# Be sure to run `pod lib lint NKQuartzClockTimePicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NKQuartzClockTimePicker'
  s.version          = '0.1.0'
  s.summary          = 'Time component picker in mechanical clock view'

  s.description      = <<-DESC
Custom time component picker in the form of a round mechanical clock with the possibility of full adjustment of  display of the clockface.
                       DESC

  s.homepage         = 'https://github.com/nkopilovskii/NKQuartzClockTimePicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nkopilovskii' => 'nkopilovskii@gmail.com' }
  s.source           = { :git => 'https://github.com/nkopilovskii/NKQuartzClockTimePicker.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MKopilovskii'

  s.ios.deployment_target = '10.0'
  s.swift_version  = '4.0'
  s.source_files = 'NKQuartzClockTimePicker/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NKQuartzClockTimePicker' => ['NKQuartzClockTimePicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
