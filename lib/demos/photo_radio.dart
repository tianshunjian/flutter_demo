import 'package:flutter/material.dart';
import 'dart:math' as math;

class PhotoRadio extends StatelessWidget {
  final String photo;
  final Color color;
  final VoidCallback onTap;

  PhotoRadio({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          photo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final clipRectSize;
  final Widget child;

  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child
  }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}



