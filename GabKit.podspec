Pod::Spec.new do |s|
  s.name             = 'GabKit'
  s.version          = '0.12.0'
  s.summary          = 'Gab api client with swift.'
  s.description      = <<-DESC
Gab api client with swift.
                       DESC

  s.homepage         = 'https://github.com/noppefoxwolf/GabKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'noppefoxwolf' => 'noppelabs@gmail.com' }
  s.source           = { :git => 'https://github.com/noppefoxwolf/GabKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/noppefoxwolf'
  s.ios.deployment_target = '10.0'
  s.source_files = 'GabKit/Classes/**/*'
  s.swift_version = '4.2'
end
