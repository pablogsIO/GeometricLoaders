Pod::Spec.new do |s|
  s.name         = "GeometricLoaders"
  s.version      = "1.1.1"
  s.summary      = "Fancy and beautiful loaders for you awesome apps!"
  s.homepage     = "https://github.com/pablogsIO/GeometricLoaders"
  s.license      = 'MIT'
  s.author       = "Pablo Garcia"
  s.source       = { :git => "https://github.com/pablogsIO/GeometricLoaders.git", :tag => s.version }
  s.screenshots   = ['https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/infinityloader.gif',
    'https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/blinkingcirclesLoader.gif',
    'https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/circleLoader.gif',
    'https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/circleinmotionloader.gif',
    'https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/orbitloader.gif',
    'https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/waterwaves.gif']
  s.platform     = :ios, '10.0'
  s.source_files = 'Source/*.swift'
  s.frameworks   = 'UIKit'
  s.swift_version= '5.0'
  s.requires_arc = true
end
