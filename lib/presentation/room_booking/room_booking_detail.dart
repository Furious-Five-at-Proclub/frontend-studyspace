import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../core/themes/theme.dart';

class RoomBookingDetail extends ConsumerStatefulWidget {
  const RoomBookingDetail({super.key});

  @override
  ConsumerState<RoomBookingDetail> createState() => _RoomBookingDetailState();
}

class _RoomBookingDetailState extends ConsumerState<RoomBookingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(134),
        child: SafeArea(
          child: const Row(
            children: [
              BackButton(),
              Text(
                'Ringkasan Booking',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ).padding(horizontal: 6).border(bottom: 1, color: grey100Color),
        ),
      ),
    );
  }
}
