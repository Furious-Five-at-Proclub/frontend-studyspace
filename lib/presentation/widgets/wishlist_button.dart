import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'study_icons.dart';

class WishlistButton extends StatefulWidget {
  final bool isWishlisted;
  final Function()? onPressed;

  const WishlistButton({
    super.key,
    this.isWishlisted = false,
    this.onPressed,
  });

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isWishlisted) {
      return Material(
        color: Colors.black.withOpacity(0.2),
        child: const Icon(
          StudyIcons.materialSymbolsFavoriteRounded,
          color: Colors.redAccent,
        ).padding(all: 8),
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
      child: const Icon(
        StudyIcons.materialSymbolsFavoriteOutlineRounded,
        color: Colors.white,
      ).padding(all: 8),
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
