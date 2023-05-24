import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class StudyIconButton extends StatefulWidget {
  final bool isActive;
  final Function()? onPressed;
  final IconData icon;
  final IconData? activeIcon;
  final double padding;

  const StudyIconButton({
    super.key,
    this.isActive = false,
    this.onPressed,
    required this.icon,
    this.activeIcon,
    this.padding = 8.0,
  });

  @override
  State<StudyIconButton> createState() => _StudyIconButtonState();
}

class _StudyIconButtonState extends State<StudyIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isActive) {
      return Material(
        color: Colors.black.withOpacity(0.2),
        child: Icon(
          widget.activeIcon ?? widget.icon,
          color: Colors.redAccent,
        ).padding(all: widget.padding),
      )
          .ripple()
          .clipRRect(all: 120)
          .borderRadius(all: 120, animate: true)
          .gestures(
            onTapChange: (tapStatus) => setState(() => _isPressed = tapStatus),
            onTap: widget.onPressed,
          )
          .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
          .animate(
              const Duration(milliseconds: 175), Curves.fastLinearToSlowEaseIn);
    }

    return Material(
      color: Colors.black.withOpacity(0.2),
      child: Icon(
        widget.icon,
        color: Colors.white,
      ).padding(all: widget.padding),
    )
        .ripple()
        .clipRRect(all: 120)
        .borderRadius(all: 120, animate: true)
        .gestures(
          onTapChange: (tapStatus) => setState(() => _isPressed = tapStatus),
          onTap: widget.onPressed,
        )
        .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
        .animate(
            const Duration(milliseconds: 175), Curves.fastLinearToSlowEaseIn);
  }
}
