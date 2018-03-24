# GeometricLoaders
![](https://img.shields.io/badge/language-swift-blue.svg)
![](https://img.shields.io/badge/version-1.0.0-red.svg)

Fancy and beautiful loaders for you awesome apps!

**Infinity loader**
<p align="center">
<img src="Images/infinityloader.gif"/>
</p>

**Orbit loader**
<p align="center">
<img src="Images/orbitloader.gif" height="120px"/>
</p>

**Circles in motion loader**
<p align="center">
<img src="Images/circleinmotionloader.gif" height="120px"/>
</p>

**Blinking circles loader**
<p align="center">
<img src="Images/blinkingcirclesLoader.gif" height="120px"/>
</p>

**Circle loader**
<p align="center">
<img src="Images/circleLoader.gif" height="120px"/>
</p>

# Requirements

* Swift 3,4

# Installation

### Manually

Just drag and drop Source folder in your project

### Cocoapods

In progress.....

# Using GeometricLoaders

It's very easy to use, just follow these steps:

### Initializing

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


# License

`GeometricLoaders` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

If you use it, i'll be happy to know about it.
