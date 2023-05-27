import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class FoodMenuItem extends StatelessWidget {
  final String imageUrl, title, description;
  final int price;

  const FoodMenuItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 64,
          width: 64,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Shimmer.fromColors(
              baseColor: grey100Color,
              highlightColor: Colors.white,
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: grey100Color,
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
              ),
            );
          },
        ).clipRRect(all: defaultBorderRadius),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                color: grey500Color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp',
                decimalDigits: 0,
              ).format(price),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
