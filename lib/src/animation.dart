part of ken_burns_slideshow;

/// Class representing the animation parameters for Ken Burns effect.
class KenBurnsAnimation {
  /// Creates a KenBurnsAnimation with specified parameters.
  ///
  /// The parameters include the beginning and ending scale, translation on X and Y axes,
  /// curve for animation, and optional duration.
  ///
  /// By default, the translate values are constrained to be less than or equal to half of the scale values.
  KenBurnsAnimation({
    this.scaleBegin = 1,
    this.scaleEnd = 1,
    this.translateXBegin = 0,
    this.translateXEnd = 0,
    this.translateYBegin = 0,
    this.translateYEnd = 0,
    this.curve = Curves.linear,
    this.duration,
  })  : assert(translateXBegin <= (scaleBegin / 2)),
        assert(translateXEnd <= (scaleEnd / 2)),
        assert(translateYBegin <= (scaleBegin / 2)),
        assert(translateYEnd <= (scaleEnd / 2));

  /// The beginning scale factor for the animation.
  final double scaleBegin;

  /// The ending scale factor for the animation.
  final double scaleEnd;

  /// The beginning translation on the X-axis for the animation.
  final double translateXBegin;

  /// The ending translation on the X-axis for the animation.
  final double translateXEnd;

  /// The beginning translation on the Y-axis for the animation.
  final double translateYBegin;

  /// The ending translation on the Y-axis for the animation.
  final double translateYEnd;

  /// The curve used for the animation.
  final Curve curve;

  /// The duration of the animation.
  final Duration? duration;

  // Pre-defined Ken Burns animations

  /// Pre-defined Ken Burns animation from top to bottom.
  static KenBurnsAnimation topToBottom = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1.2,
    translateYBegin: 0.1,
    translateYEnd: -0.1,
  );

  /// Pre-defined Ken Burns animation from bottom to top.
  static KenBurnsAnimation bottomToTop = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1.2,
    translateYBegin: -0.1,
    translateYEnd: 0.1,
  );

  /// Pre-defined Ken Burns animation from left to right.
  static KenBurnsAnimation leftToRight = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1.2,
    translateXBegin: -0.1,
    translateXEnd: 0.1,
  );

  /// Pre-defined Ken Burns animation from right to left.
  static KenBurnsAnimation rightToLeft = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1.2,
    translateXBegin: 0.1,
    translateXEnd: -0.1,
  );

  /// Pre-defined Ken Burns zoom-in animation.
  static KenBurnsAnimation zoomIn = KenBurnsAnimation(
    scaleBegin: 1.2,
    scaleEnd: 1,
  );

  /// Pre-defined Ken Burns zoom-out animation.
  static KenBurnsAnimation zoomOut = KenBurnsAnimation(
    scaleBegin: 1,
    scaleEnd: 1.2,
  );

  /// Pre-defined Ken Burns zoom-in from the left animation.
  static KenBurnsAnimation zoomInLeft = KenBurnsAnimation(
    scaleBegin: 1,
    scaleEnd: 1.3,
    translateXBegin: 0,
    translateXEnd: 0.15,
  );

  /// Pre-defined Ken Burns zoom-in from the right animation.
  static KenBurnsAnimation zoomInRight = KenBurnsAnimation(
    scaleBegin: 1,
    scaleEnd: 1.3,
    translateXBegin: 0,
    translateXEnd: -0.15,
  );
}
