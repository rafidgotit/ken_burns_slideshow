part of ken_burns_slideshow;

class KenBurnsSlideshow extends StatelessWidget {

  const KenBurnsSlideshow({
    super.key,
    required this.images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
  });

  KenBurnsSlideshow.asset({
    super.key,
    required List<String> images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
  }) : images = images.map((assetName) => AssetImage(assetName)).toList();

  KenBurnsSlideshow.network({
    super.key,
    required List<String> images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
  }) : images = images.map((url) => NetworkImage(url)).toList();

  KenBurnsSlideshow.memory({
    super.key,
    required List<Uint8List> images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
  }) : images = images.map((bytes) => MemoryImage(bytes)).toList();

  KenBurnsSlideshow.cachedNetwork({
    super.key,
    required List<String> images,
    this.background,
    this.foreground,
    this.duration,
    this.transitionDuration,
  }) : images = images.map((url) => CachedNetworkImageProvider(url)).toList();

  final Color? background;
  final Color? foreground;
  final Duration? duration;
  final Duration? transitionDuration;
  final List<ImageProvider> images;

  static Duration get _defaultDuration => const Duration(seconds: 5);
  static Duration get _defaultTransitionDuration => const Duration(seconds: 1);

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
            transitionDuration: transitionDuration ?? _defaultTransitionDuration,
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