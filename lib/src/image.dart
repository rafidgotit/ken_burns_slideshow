part of ken_burns_slideshow;

class _SlideShowImage extends StatefulWidget {
  const _SlideShowImage({
    super.key,
    required this.height,
    required this.width,
    required this.image,
    required this.duration,
    required this.transitionDuration,
  });
  final double height;
  final double width;
  final ImageProvider image;
  final Duration duration;
  final Duration transitionDuration;

  @override
  State<_SlideShowImage> createState() => _SlideShowImageState();
}

class _SlideShowImageState extends State<_SlideShowImage> with TickerProviderStateMixin {

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  Duration get _duration => widget.duration + widget.transitionDuration;

  @override
  void initState() {
    super.initState();
    _initScaleAnimationController();
    _scaleController.forward();
  }

  void _initScaleAnimationController() {
    _scaleController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1), weight: 1),
    ]).animate(_scaleController);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
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
