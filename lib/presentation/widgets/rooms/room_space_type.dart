import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class RoomSpaceType extends StatefulWidget {
  final String label;
  final String description;
  final String image;
  final bool isSelected;
  final Function()? onPressed;

  const RoomSpaceType({
    super.key,
    required this.label,
    required this.description,
    required this.image,
    this.isSelected = false, this.onPressed,
  });

  @override
  State<RoomSpaceType> createState() => _RoomSpaceTypeState();
}

class _RoomSpaceTypeState extends State<RoomSpaceType> {
  bool _isPressed = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 180,
          height: 120,
          decoration: BoxDecoration(
            color: grey300Color,
            image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(smallBorderRadius),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.description,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    )
        .padding(all: 12)
        .decorated(
          color: widget.isSelected ? ocean50Color : Colors.transparent,
          border: Border.all(
            color: widget.isSelected ? ocean500Color : grey100Color,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
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
