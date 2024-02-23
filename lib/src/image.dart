part of ken_burns_slideshow;

/// An internal StatefulWidget for handling the Ken Burns effect on slideshow images.
class _SlideShowImage extends StatefulWidget {
  const _SlideShowImage({
    super.key,
    required this.height,
    required this.width,
    required this.image,
    required this.duration,
    required this.transitionDuration,
    required this.animation,
  });

  /// The height of the image.
  final double height;

  /// The width of the image.
  final double width;

  /// The image provider.
  final ImageProvider image;

  /// The duration of the individual image display.
  final Duration duration;

  /// The duration of the transition between images.
  final Duration transitionDuration;

  /// The Ken Burns animation parameters for the image.
  final KenBurnsAnimation animation;

  @override
  State<_SlideShowImage> createState() => _SlideShowImageState();
}

class _SlideShowImageState extends State<_SlideShowImage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late _KenBurnsAnimationData data;

  /// Gets the effective duration, considering animation duration and transition duration.
  Duration get _duration =>
      (data.duration ?? widget.duration) + widget.transitionDuration;

  @override
  void initState() {
    data = _KenBurnsAnimationData.fromAnimation(widget.animation);
    super.initState();
    _initScaleAnimationController();
    _controller.forward();
  }

  /// Initializes the scale animation controller.
  void _initScaleAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 1), weight: 1),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: data.curve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: data.getTranslationValue(
              _animation.value, widget.width, widget.height),
          child: Transform.scale(
            scale: data.getScaleValue(_animation.value),
            child: child,
          ),
        );
      },
      child: Image(
        image: widget.image,
        height: widget.height,
        width: widget.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
