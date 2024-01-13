part of ken_burns_slideshow;

class _Slideshow extends StatefulWidget {
  const _Slideshow({
    required this.images,
    required this.duration,
    required this.transitionDuration,
  });
  final List<ImageProvider> images;
  final Duration duration;
  final Duration transitionDuration;

  @override
  State<_Slideshow> createState() => _SlideshowState();
}

class _SlideshowState extends State<_Slideshow> {
  int _currentIndex = 0;
  late Timer _timer;

  int get _imageIndex => _currentIndex % widget.images.length;

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
          ),
        );
      }
    );
  }
}
