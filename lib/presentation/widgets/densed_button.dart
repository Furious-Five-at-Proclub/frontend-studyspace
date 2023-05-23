import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class DensedButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double verticalPadding;
  final double horizontalPadding;
  final bool enabled;
  final bool elevated;
  final IconData? icon;
  final Function()? onPressed;

  const DensedButton({
    Key? key,
    required this.label,
    this.backgroundColor = primaryColor,
    this.textColor = Colors.white,
    this.verticalPadding = 8,
    this.horizontalPadding = 32,
    this.enabled = true,
    this.elevated = true,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  State<DensedButton> createState() => _DensedButtonState();
}

class _DensedButtonState extends State<DensedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return Text(
        widget.label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: grey300Color,
          fontWeight: FontWeight.w600,
        ),
      )
          .padding(
            vertical: widget.verticalPadding,
            horizontal: widget.horizontalPadding,
          )
          .borderRadius(all: defaultBorderRadius)
          .backgroundColor(lightGreyColor)
          .clipRRect(all: defaultBorderRadius);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) Icon(widget.icon, color: Colors.white),
        const SizedBox(width: 4),
        Text(
          widget.label,
          textAlign: TextAlign.center,
          style:
              TextStyle(color: widget.textColor, fontWeight: FontWeight.w600),
        ),
      ],
    )
        .padding(
          vertical: widget.verticalPadding,
          horizontal: widget.horizontalPadding,
        )
        .borderRadius(all: defaultBorderRadius)
        .ripple()
        .backgroundColor(widget.backgroundColor, animate: true)
        .clipRRect(all: defaultBorderRadius)
        .borderRadius(all: defaultBorderRadius, animate: true)
        .gestures(
          onTapChange: (tapStatus) => setState(() => _isPressed = tapStatus),
          onTap: widget.onPressed,
        )
        .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
        .animate(
            const Duration(milliseconds: 175), Curves.fastLinearToSlowEaseIn);
  }
}
