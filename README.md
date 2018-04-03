# Cheers

[![Version](https://img.shields.io/cocoapods/v/Cheers.svg?style=flat)](http://cocoadocs.org/docsets/Cheers)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Cheers.svg?style=flat)](http://cocoadocs.org/docsets/Cheers)
[![Platform](https://img.shields.io/cocoapods/p/Cheers.svg?style=flat)](http://cocoadocs.org/docsets/Cheers)
![Swift](https://img.shields.io/badge/%20in-swift%204.1-orange.svg)

<div align = "center">
<img src="demo.gif" width="300" height="510" />
</div>

## Usage

### Basic

```swift
// Create the view
let cheerView = CheerView()
view.addSubview(cheerView)

// Configure
cheerView.config.particle = .confetti(allowedShapes: Particle.ConfettiShape.all)

// Start
cheerView.start()

// Stop
cheerView.stop()
```

### Configuration

Configuration will be applied at the next `start`

```swift
// Use predefined confetti
cheerView.config.particle = .confetti(allowedShapes: Particle.ConfettiShape.all)

// Use texts
let string = NSAttributedString(string: "❤️", attributes: [
  NSFontAttributeName: UIFont.systemFont(ofSize: 15)
])
cheerView.config.particle = .text([string])

// Use images
let image = UIImage(named: "star")
cheerView.config.particle = .image([image])

// Change colors
cheerView.config.colors = [UIColor.red, UIColor.green]

// Customize cells
cheerView.config.customize = { cells in

}
```

## Installation

**Cheers** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Cheers'
```

**Cheers** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "hyperoslo/Cheers"
```

**Cheers** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

Hyper Interaktiv AS, ios@hyper.no

## Credit

- Background image in the demo is from http://www.freepik.com/

## Contributing

We would love you to contribute to **Cheers**, check the [CONTRIBUTING](https://github.com/hyperoslo/Cheers/blob/master/CONTRIBUTING.md) file for more info.

## License

**Cheers** is available under the MIT license. See the [LICENSE](https://github.com/hyperoslo/Cheers/blob/master/LICENSE.md) file for more info.
