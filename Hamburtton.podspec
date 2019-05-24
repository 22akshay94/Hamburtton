#
# Be sure to run `pod lib lint Hamburtton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Hamburtton'
  s.version          = '1.0.0'
  s.summary          = 'UIButton library with animation.'
  s.swift_version    = '4.0'

  s.description      = <<-DESC
A simple UIButton library with a fun transition animation for switching between selected and unselected button states.
                       DESC

  s.homepage         = 'https://github.com/22akshay94/Hamburtton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '22akshay94' => 'akshay.yerneni@hotmail.com' }
  s.source           = { :git => 'https://github.com/22akshay94/Hamburtton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@mofoprogboi'

  s.ios.deployment_target = '11.1'

  s.source_files = 'Development_Pods/Hamburtton/**/*.swift'
  
  s.resource_bundles = {
    'Hamburtton' => ['Development_Pods/Hamburtton/**/*.xib']
  }

end
