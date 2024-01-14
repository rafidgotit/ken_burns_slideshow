part of ken_burns_slideshow;

class _Slideshow extends StatefulWidget {
  const _Slideshow({
    required this.images,
    required this.transitionDuration,
    required this.duration,
    required this.animationSequence,
  }) : assert(images.length > 0 && animationSequence.length > 0);
  final List<ImageProvider> images;
  final Duration transitionDuration;
  final Duration duration;
  final List<KenBurnsAnimation> animationSequence;

  @override
  State<_Slideshow> createState() => _SlideshowState();
}

class _SlideshowState extends State<_Slideshow> {
  int _currentIndex = 0;
  late Timer _timer;

  int get _imageIndex => _currentIndex % widget.images.length;
  int get _animationIndex => _currentIndex % widget.animationSequence.length;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      _showNextImage();
    });
  }

  void _showNextImage() {
    setState(() => _currentIndex++);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var height = constraints.maxHeight;
        var width = constraints.maxWidth;
        return AnimatedSwitcher(
          duration: widget.transitionDuration,
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: _SlideShowImage(
            key: ValueKey<int>(_imageIndex),
            height: height,
            width: width,
            image: widget.images[_imageIndex],
            duration: widget.duration,
            transitionDuration: widget.transitionDuration,
            animation: widget.animationSequence[_animationIndex]
          ),
        );
      }
    );
  }
}
