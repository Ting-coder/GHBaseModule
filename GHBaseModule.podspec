#
# Be sure to run `pod lib lint GHBaseModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GHBaseModule'
  s.version          = '0.1.1'
  s.summary          = 'GHBaseModule'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
组件化基础组件相关
                       DESC

  s.homepage         = 'https://github.com/Ting-coder/GHBaseModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'haoguanhao' => '1101895317@qq.com' }
  s.source           = { :git => 'https://github.com/Ting-coder/GHBaseModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'

# s.source_files = 'GHBaseModule/Classes/**/*'
  
  s.subspec 'Base' do |b|
      b.source_files = 'GHBaseModule/Classes/Base/**/*'
  end
  
  s.subspec 'Extension' do |e|
      e.source_files = 'GHBaseModule/Classes/Extension/**/*'
  end
  
  s.subspec 'Layout' do |l|
      l.source_files = 'GHBaseModule/Classes/Layout/**/*'
  end
  
  s.subspec 'ViewModel' do |v|
      v.source_files = 'GHBaseModule/Classes/ViewModel/**/*'
      # v.dependency 'AFNetworking'
  end
  
  s.subspec 'Protocol' do |p|
      p.source_files = 'GHBaseModule/Classes/Protocol/**/*'
  end
  
  s.subspec 'Tools' do |t|
      t.source_files = 'GHBaseModule/Classes/Tools/**/*'
  end
  
  
  # s.resource_bundles = {
  #   'GHBaseModule' => ['GHBaseModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
