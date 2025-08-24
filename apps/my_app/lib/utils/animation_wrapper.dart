import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum AnimationType {
  slideIn,
  fadeIn,
  scale,
}

class AnimationWrapper {
  static Widget wrapWithAnimation({
    required Widget child,
    required int index,
    required AnimationType animationType,
    int columnCount = 2,
  }) {
    switch (animationType) {
      case AnimationType.slideIn:
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 800),
          columnCount: columnCount,
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: child,
            ),
          ),
        );
      case AnimationType.fadeIn:
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 1000),
          columnCount: columnCount,
          child: FadeInAnimation(
            curve: Curves.easeInOutCubic,
            child: child,
          ),
        );
      case AnimationType.scale:
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 600),
          columnCount: columnCount,
          child: ScaleAnimation(
            scale: 0.5,
            curve: Curves.elasticOut,
            child: FadeInAnimation(
              child: child,
            ),
          ),
        );
    }
  }

  static AnimationType getAnimationTypeFromIndex(int index) {
    return AnimationType.values[index % AnimationType.values.length];
  }
}