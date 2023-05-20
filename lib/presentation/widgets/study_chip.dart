import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../core/themes/theme.dart';

class StudyChip extends StatefulWidget {
  final String label;
  final bool selected;
  final Function()? onPressed;

  const StudyChip({
    super.key,
    required this.label,
    this.onPressed,
    this.selected = false,
  });

  @override
  State<StudyChip> createState() => _StudyChipState();
}

class _StudyChipState extends State<StudyChip> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.selected) {
      return Material(
        color: ocean50Color,
        borderRadius: BorderRadius.circular(120),
        child: Text(
          widget.label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
            .padding(vertical: 8, horizontal: 12)
            .ripple(splashColor: ocean500Color.withOpacity(.2))
            .clipRRect(all: 120)
            .decorated(
              border: Border.all(color: ocean500Color, width: 2),
              borderRadius: BorderRadius.circular(120),
            )
            .gestures(
              onTapChange: (tapStatus) =>
                  setState(() => _isPressed = tapStatus),
              onTap: widget.onPressed,
            )
            .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
            .animate(const Duration(milliseconds: 175),
                Curves.fastLinearToSlowEaseIn),
      );
    }

    return Text(
      widget.label,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    )
        .padding(vertical: 8, horizontal: 12)
        .ripple()
        .clipRRect(all: 120)
        .decorated(
          border: Border.all(color: grey100Color, width: 2),
          borderRadius: BorderRadius.circular(120),
        )
        .gestures(
          onTapChange: (tapStatus) => setState(() => _isPressed = tapStatus),
          onTap: widget.onPressed,
        )
        .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
        .animate(
            const Duration(milliseconds: 175), Curves.fastLinearToSlowEaseIn);
  }
}
