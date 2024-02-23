# ken_burns_slideshow

[![Build](https://img.shields.io/badge/pub-v1.0.1-%23009F00)](https://pub.dev/packages/ken_burns_slideshow)
[![Build](https://img.shields.io/badge/licence-MIT-%23f16f12)](https://github.com/rafidgotit/ken_burns_slideshow/blob/master/LICENSE)

A Flutter library for creating Ken Burns effect slideshows.

This library provides a set of widgets and animations to create Ken Burns effect slideshows in Flutter applications.

![Demo](https://raw.githubusercontent.com/rafidgotit/ken_burns_slideshow/master/resources/demo.gif)

If you find this widget useful, consider supporting the developer by [buying them a coffee](https://www.buymeacoffee.com/rafid).

<a href="https://www.buymeacoffee.com/rafid" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-blue.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
ken_burns_slideshow: $latest_version
```
The latest version of the package is   [![Build](https://img.shields.io/badge/pub-v1.0.1-%23009F00)](https://pub.dev/packages/ken_burns_slideshow)

## Usage
Firstly, import in dart code:
```
import 'package:ken_burns_slideshow/ken_burns_slideshow.dart';
```

To use the `ken_burns_slideshow`, follow these steps:

1. Make sure to have a fixed height parent widget.

2. Within your Flutter widget tree, simply add the `KenBurnsSlideshow` widget.
```dart
KenBurnsSlideshow.asset(
  background: Colors.black,
  foreground: Colors.black38,
  images: const [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
  ],
)
```

### Image Sources
`KenBurnsSlideshow` supports different image sources.
- `KenBurnsSlideshow.asset`
- `KenBurnsSlideshow.network`
- `KenBurnsSlideshow.memory`
- `KenBurnsSlideshow.cachedNetwork`

### Animation Sequence
`KenBurnsSlideshow` receives `List<KenBurnsAnimation>` as parameter named `animationSequence` where you can pass your animation sequence. Animations will be iterated from the passed list.

### Pre-Defined & Custom Animations
You can create custom animations using `KenBurnsAnimation` class.
```
var myAnimation = KenBurnsAnimation(
  scaleBegin: 1,
  scaleEnd: 1.3,
  translateXBegin: 0,
  translateXEnd: -0.15,
)
```

However, `KenBurnsSlideshow` comes with some pre-defined animations:
- `topToBottom`
- `bottomToTop`
- `leftToRight`
- `rightToLeft`
- `zoomIn`
- `zoomOut`
- `zoomInLeft`
- `zoomInRight`


For more Information about the Classes, Enums, Functions etc, visit [API Reference](https://pub.dev/documentation/ken_burns_slideshow/latest/).
