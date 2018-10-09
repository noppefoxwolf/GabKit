Pod::Spec.new do |s|
  s.name             = 'GabKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of GabKit.'
  s.description      = <<-DESC
WIP - Gab api client with swift.
                       DESC

  s.homepage         = 'https://github.com/noppefoxwolf/GabKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'noppefoxwolf' => 'noppelabs@gmail.com' }
  s.source           = { :git => 'https://github.com/noppefoxwolf/GabKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/noppefoxwolf'
  s.ios.deployment_target = '8.0'
  s.source_files = 'GabKit/Classes/**/*'
end
