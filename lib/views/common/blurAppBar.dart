import 'dart:ui';
import 'package:flutter/material.dart';

import 'constants.dart';

class BlurAppBar extends StatelessWidget implements PreferredSize {
  final double height;
  final Widget child;
  final EdgeInsets? padding;

  const BlurAppBar({
    required this.height,
    required this.child,
    this.padding,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: gBlurSigma,
          sigmaY: gBlurSigma,
        ),
        child: Container(
          alignment: Alignment.topLeft,
          constraints: BoxConstraints.expand(),
          color: gAppBarColor.withOpacity(gBarOpacity),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
