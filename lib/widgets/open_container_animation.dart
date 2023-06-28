import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerWidget extends StatelessWidget {
  const OpenContainerWidget({
    super.key,
    required this.transitionType,
    required this.path,
    required this.object,
    this.text,
    this.icon,
    required this.width,
    required this.height,
    required this.size,
    required this.radius,
  });

  final ContainerTransitionType transitionType;
  final String path;
  final Widget object;
  final String? text;
  final IconData? icon;
  final double width;
  final double height;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, VoidCallback closeContainer) {
        return object;
      },
      closedBuilder: (context, VoidCallback openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.white),
            width: width,
            height: height,
            child: Center(
              child: Icon(
                icon!,
                size: size,
                color: Colors.black87,
              ),
            ),
          ),
        );
      },
      closedColor: Colors.white,
      openColor: Colors.white,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      transitionType: transitionType,
      transitionDuration: const Duration(milliseconds: 600),
      routeSettings: RouteSettings(name: path),
    );
  }
}
