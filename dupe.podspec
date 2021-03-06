#
# Be sure to run `pod lib lint dupe.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "dupe"
  s.version          = "0.1.0"
  s.summary          = "A short description of dupe."
  s.description      = <<-DESC
                       An optional longer description of dupe

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/dupe"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Phillip Calvin" => "phillip.calvin@eleostech.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/dupe.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*', 'Pod/API'
  s.resource_bundles = {
    'dupe' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/API/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
