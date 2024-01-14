part of ken_burns_slideshow;

class _KenBurnsAnimationData extends KenBurnsAnimation {
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

  double getScaleValue(double animationValue) {
    return scaleBegin + (scaleEnd - scaleBegin) * animationValue;
  }

  Offset getTranslationValue(double animationValue, double width, double height) {
    var translateX = translateXBegin + (translateXEnd - translateXBegin) * animationValue;
    var translateY = translateYBegin + (translateYEnd - translateYBegin) * animationValue;
    return Offset(translateX * width, translateY * height);
  }

  factory _KenBurnsAnimationData.fromAnimation(KenBurnsAnimation kenBurnsAnimation) {
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