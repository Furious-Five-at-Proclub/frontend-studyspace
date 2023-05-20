import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../wishlist_button.dart';
import '../study_icons.dart';

class RoomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final double distance;
  final int price;
  final int? discountedPrice;
  final int hourlyRate;
  final bool isWishlisted;
  final double stars;
  final int reviews;

  const RoomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.distance,
    required this.price,
    this.discountedPrice,
    required this.hourlyRate,
    this.isWishlisted = false,
    required this.stars,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: size.width - 40,
              width: size.width - 40,
              decoration: BoxDecoration(
                color: grey100Color,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (discountedPrice != null)
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hemat ${((1 - (discountedPrice! / price)) * 100).round()}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ).padding(all: 8).backgroundColor(orange500Color),
              ).padding(top: 16),
            Align(
              alignment: Alignment.topRight,
              child: WishlistButton(isWishlisted: isWishlisted),
            ).padding(top: 16, right: 16),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
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
                Text('$stars ($reviews)', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ).padding(horizontal: 4),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              location,
              style: const TextStyle(fontSize: 16, color: grey700Color),
            ),
            const SizedBox(width: 8),
            const Text(
              '•',
              style: TextStyle(fontSize: 8, color: grey700Color),
            ),
            const SizedBox(width: 8),
            Text(
              '$distance km',
              style: const TextStyle(fontSize: 16, color: grey500Color),
            ),
          ],
        ).padding(horizontal: 4),
        const SizedBox(height: 8),
        if (discountedPrice != null)
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Rp$price',
                    style: const TextStyle(
                      fontSize: 14,
                      color: grey300Color,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/${hourlyRate}jam',
                    style: const TextStyle(fontSize: 14, color: grey500Color),
                  ),
                ],
              ).padding(horizontal: 4),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Rp$discountedPrice',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/${hourlyRate}jam',
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
                'Rp$price',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 4),
              Text(
                '/${hourlyRate}jam',
                style: const TextStyle(fontSize: 14, color: grey500Color),
              ),
            ],
          ).padding(horizontal: 4),
      ],
    );
  }
}
