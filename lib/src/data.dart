part of ken_burns_slideshow;

/// Represents the data for a Ken Burns animation effect, including scale and translation values.
///
/// This class extends [KenBurnsAnimation] and provides additional methods for obtaining
/// scale and translation values based on the animation progress.
class _KenBurnsAnimationData extends KenBurnsAnimation {
  /// Creates a _KenBurnsAnimationData instance with specified parameters.
  ///
  /// - [scaleBegin]: The beginning scale factor for the animation.
  /// - [scaleEnd]: The ending scale factor for the animation.
  /// - [translateXBegin]: The beginning translation on the X-axis for the animation.
  /// - [translateXEnd]: The ending translation on the X-axis for the animation.
  /// - [translateYBegin]: The beginning translation on the Y-axis for the animation.
  /// - [translateYEnd]: The ending translation on the Y-axis for the animation.
  /// - [curve]: The curve used for the animation.
  /// - [duration]: The duration of the animation.
  _KenBurnsAnimationData({
    required double scaleBegin,
    required double scaleEnd,
    required double translateXBegin,
    required double translateXEnd,
    required double translateYBegin,
    required double translateYEnd,
    required Curve curve,
    Duration? duration,
  }) : super(
          scaleBegin: scaleBegin,
          scaleEnd: scaleEnd,
          translateXBegin: translateXBegin,
          translateXEnd: translateXEnd,
          translateYBegin: translateYBegin,
          translateYEnd: translateYEnd,
          curve: curve,
          duration: duration,
        );

  /// Gets the scale value based on the animation progress.
  ///
  /// - [animationValue]: The progress of the animation (0.0 to 1.0).
  double getScaleValue(double animationValue) {
    return scaleBegin + (scaleEnd - scaleBegin) * animationValue;
  }

  /// Gets the translation value based on the animation progress and the dimensions of the target area.
  ///
  /// - [animationValue]: The progress of the animation (0.0 to 1.0).
  /// - [width]: The width of the target area.
  /// - [height]: The height of the target area.
  Offset getTranslationValue(
      double animationValue, double width, double height) {
    var translateX =
        translateXBegin + (translateXEnd - translateXBegin) * animationValue;
    var translateY =
        translateYBegin + (translateYEnd - translateYBegin) * animationValue;
    return Offset(translateX * width, translateY * height);
  }

  /// Creates a _KenBurnsAnimationData instance from a [KenBurnsAnimation].
  ///
  /// Useful for converting an external KenBurnsAnimation instance to _KenBurnsAnimationData.
  factory _KenBurnsAnimationData.fromAnimation(
      KenBurnsAnimation kenBurnsAnimation) {
    return _KenBurnsAnimationData(
      scaleBegin: kenBurnsAnimation.scaleBegin,
      scaleEnd: kenBurnsAnimation.scaleEnd,
      translateXBegin: kenBurnsAnimation.translateXBegin,
      translateXEnd: kenBurnsAnimation.translateXEnd,
      translateYBegin: kenBurnsAnimation.translateYBegin,
      translateYEnd: kenBurnsAnimation.translateYEnd,
      curve: kenBurnsAnimation.curve,
      duration: kenBurnsAnimation.duration,
    );
  }
}
