import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../study_icon_button.dart';
import '../study_icons.dart';

class RoomCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;
  final double distance;
  final int price;
  final int? discountedPrice;
  final int hourlyRate;
  final double stars;
  final int reviews;
  /* wishlist related */
  final bool isWishlisted;
  final Function()? wishlistOnPressed;
  /* */
  final Function()? onPressed;

  const RoomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.distance,
    required this.price,
    this.discountedPrice,
    required this.hourlyRate,
    required this.stars,
    required this.reviews,
    /* wishlist related */
    this.isWishlisted = false,
    this.wishlistOnPressed,
    this.onPressed,
  });

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              height: size.width - 40,
              width: size.width - 40,
              imageUrl: widget.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: grey100Color,
                  highlightColor: Colors.white,
                  child: Container(
                    height: size.width - 40,
                    width: size.width - 40,
                    color: grey200Color,
                  ),
                );
              },
            ).clipRRect(all: defaultBorderRadius).padding(horizontal: 4),
            if (widget.discountedPrice != null)
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hemat ${((1 - (widget.discountedPrice! / widget.price)) * 100).round()}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ).padding(all: 8).backgroundColor(orange500Color),
              ).padding(top: 16),
            /* wishlist related */
            Align(
              alignment: Alignment.topRight,
              child: StudyIconButton(
                isActive: widget.isWishlisted,
                onPressed: widget.wishlistOnPressed,
                icon: StudyIcons.materialSymbolsFavoriteOutlineRounded,
                activeIcon: StudyIcons.materialSymbolsFavoriteRounded,
              ),
            ).padding(top: 16, right: 16),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: grey900Color,
              ),
            ),
            Row(
              children: [
                const Icon(
                  StudyIcons.materialSymbolsStarRounded,
                  color: ocean500Color,
                ),
                const SizedBox(width: 4),
                Text('${widget.stars} (${widget.reviews})',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ).padding(horizontal: 4),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              widget.location,
              style: const TextStyle(fontSize: 16, color: grey700Color),
            ),
            const SizedBox(width: 8),
            const Text(
              '•',
              style: TextStyle(fontSize: 8, color: grey700Color),
            ),
            const SizedBox(width: 8),
            Text(
              '${widget.distance} km',
              style: const TextStyle(fontSize: 16, color: grey500Color),
            ),
          ],
        ).padding(horizontal: 4),
        const SizedBox(height: 8),
        if (widget.discountedPrice != null)
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Rp${widget.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: grey300Color,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/${widget.hourlyRate}jam',
                    style: const TextStyle(fontSize: 14, color: grey500Color),
                  ),
                ],
              ).padding(horizontal: 4),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Rp${widget.discountedPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/${widget.hourlyRate}jam',
                    style: const TextStyle(fontSize: 14, color: grey500Color),
                  ),
                ],
              ).padding(horizontal: 4),
            ],
          )
        else
          Row(
            children: [
              Text(
                'Rp${widget.price}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 4),
              Text(
                '/${widget.hourlyRate}jam',
                style: const TextStyle(fontSize: 14, color: grey500Color),
              ),
            ],
          ).padding(horizontal: 4),
      ],
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
