part of ken_burns_slideshow;

/// A widget representing a Ken Burns effect slideshow.
class KenBurnsSlideshow extends StatelessWidget {
  /// Creates a KenBurnsSlideshow widget.
  ///
  /// - [images]: The list of ImageProvider for the slideshow.
  /// - [background]: The background color of the slideshow.
  /// - [foreground]: The foreground color of the slideshow.
  /// - [duration]: The duration of each individual image display.
  /// - [transitionDuration]: The duration of the transition between images.
  /// - [animationSequence]: The sequence of Ken Burns animations to be applied to the images.
  const KenBurnsSlideshow({
    super.key,
    required this.images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
    this.animationSequence,
  });

  /// Creates a KenBurnsSlideshow widget with images from assets.
  ///
  /// - [images]: The list of asset names for the slideshow.
  /// - [background]: The background color of the slideshow.
  /// - [foreground]: The foreground color of the slideshow.
  /// - [duration]: The duration of each individual image display.
  /// - [transitionDuration]: The duration of the transition between images.
  /// - [animationSequence]: The sequence of Ken Burns animations to be applied to the images.
  KenBurnsSlideshow.asset({
    super.key,
    required List<String> images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
    this.animationSequence,
  }) : images = images.map((assetName) => AssetImage(assetName)).toList();

  /// Creates a KenBurnsSlideshow widget with images from network URLs.
  ///
  /// - [images]: The list of network URLs for the slideshow.
  /// - [background]: The background color of the slideshow.
  /// - [foreground]: The foreground color of the slideshow.
  /// - [duration]: The duration of each individual image display.
  /// - [transitionDuration]: The duration of the transition between images.
  /// - [animationSequence]: The sequence of Ken Burns animations to be applied to the images.
  KenBurnsSlideshow.network({
    super.key,
    required List<String> images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
    this.animationSequence,
  }) : images = images.map((url) => NetworkImage(url)).toList();

  /// Creates a KenBurnsSlideshow widget with images from memory.
  ///
  /// - [images]: The list of Uint8List for the slideshow.
  /// - [background]: The background color of the slideshow.
  /// - [foreground]: The foreground color of the slideshow.
  /// - [duration]: The duration of each individual image display.
  /// - [transitionDuration]: The duration of the transition between images.
  /// - [animationSequence]: The sequence of Ken Burns animations to be applied to the images.
  KenBurnsSlideshow.memory({
    super.key,
    required List<Uint8List> images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
    this.animationSequence,
  }) : images = images.map((bytes) => MemoryImage(bytes)).toList();

  /// Creates a KenBurnsSlideshow widget with images from network URLs & store them in cache using CachedNetworkImageProvider.
  ///
  /// - [images]: The list of network URLs for the slideshow.
  /// - [background]: The background color of the slideshow.
  /// - [foreground]: The foreground color of the slideshow.
  /// - [duration]: The duration of each individual image display.
  /// - [transitionDuration]: The duration of the transition between images.
  /// - [animationSequence]: The sequence of Ken Burns animations to be applied to the images.
  KenBurnsSlideshow.cachedNetwork({
    super.key,
    required List<String> images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
    this.animationSequence,
  }) : images = images.map((url) => CachedNetworkImageProvider(url)).toList();

  /// The list of ImageProvider for the slideshow.
  final List<ImageProvider> images;

  /// The background color of the slideshow.
  final Color? background;

  /// The foreground color of the slideshow.
  final Color? foreground;

  /// The duration of each individual image display.
  final Duration? duration;

  /// The duration of the transition between images.
  final Duration? transitionDuration;

  /// The sequence of Ken Burns animations to be applied to the images.
  final List<KenBurnsAnimation>? animationSequence;

  /// The default duration for individual image display.
  static Duration get _defaultDuration => const Duration(seconds: 5);

  /// The default duration for the transition between images.
  static Duration get _defaultTransitionDuration => const Duration(seconds: 1);

  /// The default sequence of Ken Burns animations.
  static final List<KenBurnsAnimation> _defaultSequence = [
    KenBurnsAnimation.leftToRight,
    KenBurnsAnimation.rightToLeft,
    KenBurnsAnimation.zoomOut,
    KenBurnsAnimation.bottomToTop,
    KenBurnsAnimation.topToBottom,
    KenBurnsAnimation.zoomIn,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: background ?? Colors.black,
          ),
        ),
        Positioned.fill(
          child: _Slideshow(
            images: images,
            duration: duration ?? _defaultDuration,
            transitionDuration:
                transitionDuration ?? _defaultTransitionDuration,
            animationSequence: animationSequence ?? _defaultSequence,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: foreground ?? Colors.black12,
          ),
        ),
      ],
    );
  }
}
