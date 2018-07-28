# GeometricLoaders
![](https://img.shields.io/badge/language-swift-blue.svg)
![](https://img.shields.io/badge/version-1.0.0-red.svg)
[![License](https://img.shields.io/cocoapods/l/RecordButton.svg?style=flat)](https://github.com/pablogsIO/GeometricLoaders)
[![Platform](https://img.shields.io/cocoapods/p/RecordButton.svg?style=flat)](https://github.com/pablogsIO/GeometricLoaders)

Fancy and beautiful loaders for you awesome apps!

**Infinity loader**
<p align="center">
<img src="https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/infinityloader.gif"/>
</p>

**Orbit loader**
<p align="center">
<img src="https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/orbitloader.gif" height="120px"/>
</p>

**Circles in motion loader**
<p align="center">
<img src="https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/circleinmotionloader.gif" height="120px"/>
</p>

**Blinking circles loader**
<p align="center">
<img src="https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/blinkingcirclesLoader.gif" height="120px"/>
</p>

**Circle loader**
<p align="center">
<img src="https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/circleLoader.gif" height="120px"/>
</p>

**Water Waves loader**
<p align="center">
<img src="https://raw.githubusercontent.com/pablogsIO/GeometricLoaders/master/Images/waterwaves.gif" height="120px"/>
</p>

# Requirements

* Swift 3,4

# Installation

### Manually

Just drag and drop Source folder in your project

### Cocoapods

use_frameworks!

pod 'GeometricLoaders'

# Using GeometricLoaders

It's very easy to use, just follow these steps:

### Initializing
For Infinity loader...

```swift
var container: Infinity?
```

In viewDidAppear function of your ViewController add the following sentence:
```swift
container = Infinity.createGeometricLoader()
```
### Start animation
```swift
container.startAnimation()
```
### Stop animation
```swift
container.stopAnimation()
```

# Customisations

### Infinity

```swift
infinityGeometricLoader.circleColor = UIColor.red
```

### CirclesInMotion
```swift
circlesInMotionGeometricLoader.circleColor = UIColor.red
```
### BlinkingCircles
```swift
blinkingCirclesGeometricLoader.circleColor = UIColor.red
blinkingCirclesGeometricLoader.totalCircles = 10
```
### Orbit
```swift
orbitGeometricLoader.circleColor = UIColor.red
```
### CircleLoader
```swift
circleLoader.startGradientColor = UIColor.blue.cgColor
circleLoader.endGradientColor = UIColor.green.cgColor
```
### WaterWaves
```swift
waterwavesLoader.numberCircles = 3
waterwavesLoader.circleColor = UIColor.green.cgColor
```

# License

`GeometricLoaders` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

If you use it, I'll be happy to know about it.
