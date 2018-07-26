Pod::Spec.new do |s|
  s.name         = "GeometricLoaders"
  s.version      = "1.0"
  s.summary      = "Fancy and beautiful loaders for you awesome apps!"
  s.homepage     = "https://github.com/pablogsIO/GeometricLoaders"
  s.license      = 'MIT'
  s.author       = "Pablo Garcia"
  s.source       = { :git => "https://github.com/pablogsIO/GeometricLoaders.git", :tag => "1.0" }
  s.platform     = :ios, '10.0'
  s.source_files = 'Source'
  s.frameworks   = 'UIKit'
  s.swift_version= '4.0'
  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/_pablogs_'
end
