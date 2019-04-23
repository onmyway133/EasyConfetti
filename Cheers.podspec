Pod::Spec.new do |s|
  s.name             = "Cheers"
  s.summary          = "Fancy confetti effects in Swift"
  s.version          = "2.3.0"
  s.homepage         = "https://github.com/onmyway133/Cheers"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/Cheers.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.macos.deployment_target = '10.13'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.2'

  s.requires_arc = true
  s.source_files = 'Sources/Common/**/*'
  s.osx.source_files = 'Sources/macOS/**/*'
  s.swift_version = '5.0'
end
