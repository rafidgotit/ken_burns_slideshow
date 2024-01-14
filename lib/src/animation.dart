part of ken_burns_slideshow;

class KenBurnsAnimation {
  KenBurnsAnimation({
    this.scaleBegin = 1,
    this.scaleEnd = 1,
    this.translateXBegin = 0,
    this.translateXEnd = 0,
    this.translateYBegin = 0,
    this.translateYEnd = 0,
    this.curve = Curves.linear,
    this.duration,
  }) : assert(translateXBegin <= (scaleBegin/2)),
       assert(translateXEnd <= (scaleEnd/2)),
       assert(translateYBegin <= (scaleBegin/2)),
       assert(translateYEnd <= (scaleEnd/2));
  final double scaleBegin;
  final double scaleEnd;
  final double translateXBegin;
  final double translateXEnd;
  final double translateYBegin;
  final double translateYEnd;
  final Curve curve;
  final Duration? duration;

  static KenBurnsAnimation topToBottom = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1.2,
    translateYBegin: 0.1,
    translateYEnd: -0.1,
  );

  static KenBurnsAnimation bottomToTop = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1.2,
    translateYBegin: -0.1,
    translateYEnd: 0.1,
  );

  static KenBurnsAnimation leftToRight = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1.2,
    translateXBegin: -0.1,
    translateXEnd: 0.1,
  );

  static KenBurnsAnimation rightToLeft = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1.2,
    translateXBegin: 0.1,
    translateXEnd: -0.1,
  );

  static KenBurnsAnimation zoomIn = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1,
  );

  static KenBurnsAnimation zoomOut = KenBurnsAnimation(
    scaleBegin: 1,
    scaleEnd: 1.2,
  );

  static KenBurnsAnimation zoomInLeft = KenBurnsAnimation(
    scaleBegin: 1,
    scaleEnd: 1.3,
    translateXBegin: 0,
    translateXEnd: 0.15,
  );

  static KenBurnsAnimation zoomInRight = KenBurnsAnimation(
    scaleBegin: 1,
    scaleEnd: 1.3,
    translateXBegin: 0,
    translateXEnd: -0.15,
  );
}