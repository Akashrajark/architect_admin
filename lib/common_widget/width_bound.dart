import 'package:flutter/material.dart';

class WidthBound extends StatelessWidget {
  final Widget child;
  final double width;
  final double padding;
  final Color backgroundColor;
  const WidthBound(
      {super.key,
      required this.child,
      this.width = 1800,
      this.padding = 30,
      this.backgroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    return Center(
      child: (MediaQuery.of(context).size.width < 1200)
          ? const Text(
              'Screen width must be over 1200px',
            )
          : Material(
              color: backgroundColor,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 300.0,
                  maxWidth: maxWidth > width ? width : maxWidth,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: child,
                ),
              ),
            ),
    );
  }
}
