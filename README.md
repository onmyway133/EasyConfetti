# EasyConfetti

<a href="https://www.buymeacoffee.com/onmyway133"> 
    <img alt="Buy Me A Coffee" src="https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png" style="height: auto !important; width: auto !important;" /> 
</a>

❤️ Support my apps ❤️ 

- [Push Hero - pure Swift native macOS application to test push notifications](https://onmyway133.com/pushhero)
- [PastePal - Pasteboard, note and shortcut manager](https://onmyway133.com/pastepal)
- [My other apps](https://onmyway133.com/apps/)

❤️❤️😇😍🤘❤️❤️

<div align = "center">
<img src="demo.gif" width="300" height="510" />
</div>

## Usage

### Basic

```swift
// Create the view
let confettiView = ConfettiView()
view.addSubview(confettiView)

// Configure
confettiView.config.particle = .confetti(allowedShapes: Particle.ConfettiShape.all)

// Start
confettiView.start()

// Stop
confettiView.stop()
```

### Configuration

Configuration will be applied at the next `start`

```swift
// Use predefined confetti
confettiView.config.particle = .confetti(allowedShapes: Particle.ConfettiShape.all)

// Use texts
let string = NSAttributedString(string: "❤️", attributes: [
  NSFontAttributeName: UIFont.systemFont(ofSize: 15)
])
confettiView.config.particle = .text([string])

// Use images
let image = UIImage(named: "star")
confettiView.config.particle = .image([image])

// Change colors
confettiView.config.colors = [UIColor.red, UIColor.green]

// Customize cells
confettiView.config.customize = { cells in

}
```

## Installation

**EasyConfetti** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyConfetti'
```

**EasyConfetti** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "hyperoslo/EasyConfetti"
```

**EasyConfetti** is also available through [Accio](https://github.com/JamitLabs/Accio).
To install just write into your Package.swift:

```swift
.package(url: "https://github.com/onmyway133/EasyConfetti.git", .upToNextMajor(from: "2.3.0")),
```

Then link `EasyConfetti` in your App target like so:

```swift
.target(
    name: "App",
    dependencies: [
        "EasyConfetti",
    ]
),
```

**EasyConfetti** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

- Khoa Pham, onmyway133@gmai.com

## Credit

- Hyper Interaktiv AS, ios@hyper.no
- Background image in the demo is from http://www.freepik.com/

## Contributing

We would love you to contribute to **EasyConfetti**, check the [CONTRIBUTING](https://github.com/hyperoslo/EasyConfetti/blob/master/CONTRIBUTING.md) file for more info.

## License

**EasyConfetti** is available under the MIT license. See the [LICENSE](https://github.com/hyperoslo/EasyConfetti/blob/master/LICENSE.md) file for more info.
