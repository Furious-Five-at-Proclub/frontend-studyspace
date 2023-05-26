import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/study_icons.dart';
import '../payment/payment_method_page.dart';
import 'viewmodel/room_booking_summary_viewmodel.dart';

class RoomBookingSummaryPage extends ConsumerStatefulWidget {
  const RoomBookingSummaryPage({super.key});

  @override
  ConsumerState<RoomBookingSummaryPage> createState() => _RoomBookingSummaryState();
}

class _RoomBookingSummaryState extends ConsumerState<RoomBookingSummaryPage> {
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
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rp10.000',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text('/1 jam'),
              ],
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/book/detail');
              },
              label: 'Bayar',
              enabled: ref.watch(roomBookingSummaryViewModel).selectedPayment !=
                  null,
              verticalPadding: 8.5,
              horizontalPadding: 65,
            ),
          ],
        ),
      ).padding(horizontal: 20, vertical: 12).decorated(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            offset: const Offset(0, -2),
            blurRadius: 2,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Lokasi',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: grey500Color,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: grey100Color,
                    borderRadius: BorderRadius.circular(mediumBorderRadius),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1694&q=80',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Karuna Space',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Jl. Dago Bandung No. 110, Kecamatan Bandung, Kota Bandung, Jawa Barat',
                      style: TextStyle(
                        fontSize: 12,
                        color: grey700Color,
                      ),
                    ),
                  ],
                ).expanded(),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Tipe Space',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: grey500Color,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text(
                  'Hangout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 8),
                Text(
                  '•',
                  style: TextStyle(fontSize: 8, color: grey500Color),
                ),
                SizedBox(width: 8),
                Text(
                  '6 orang',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Waktu',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: grey500Color,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 8),
                const Text(
                  '•',
                  style: TextStyle(fontSize: 8, color: grey500Color),
                ),
                const SizedBox(width: 8),
                const Text(
                  '13:00 WIB',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 8),
                const Text(
                  '•',
                  style: TextStyle(fontSize: 8, color: grey500Color),
                ),
                const SizedBox(width: 8),
                const Text(
                  '1 jam',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Check-in 13:00 WIB, check-out 13:50 WIB',
              style: TextStyle(fontSize: 14, color: grey700Color),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1, color: grey100Color, height: 0),
            const SizedBox(height: 20),
            const Text(
              'Metode Pembayaran',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            if (ref.watch(roomBookingSummaryViewModel).selectedPayment != null)
              _buildPaymentMethodCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/payment',
                    arguments: PaymentMethodPageArgs(
                      selectedPayment: ref
                          .watch(roomBookingSummaryViewModel)
                          .selectedPayment,
                      onConfirmed: (selectedPayment) {
                        ref
                            .read(roomBookingSummaryViewModel)
                            .selectPayment(selectedPayment);
                      },
                    ),
                  );
                },
                label: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/${ref.watch(roomBookingSummaryViewModel).selectedPayment!.image}',
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              )
            else
              _buildPaymentMethodCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/payment',
                    arguments: PaymentMethodPageArgs(
                      onConfirmed: (selectedPayment) {
                        ref
                            .read(roomBookingSummaryViewModel)
                            .selectPayment(selectedPayment);
                      },
                    ),
                  );
                },
                label: const Text(
                  'Pilih metode pembayaran',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: grey700Color,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            const Divider(thickness: 1, color: grey100Color, height: 0),
            const SizedBox(height: 20),
            const Text(
              'Ringkasan Pembayaran',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Karuna Space',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '•',
                              style:
                                  TextStyle(fontSize: 8, color: grey500Color),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Hangout',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Text(
                          '1 jam',
                          style: TextStyle(color: grey500Color),
                        ),
                      ],
                    ).expanded(),
                    const Text(
                      'Rp10.000',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(thickness: 1, color: grey100Color, height: 0),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Rp10.000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ).padding(all: 12).decorated(
                  border: Border.all(width: 1, color: grey100Color),
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard({
    required Widget label,
    required Function() onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            label.expanded(),
            const Icon(
              StudyIcons.materialSymbolsChevronRightRounded,
              color: ocean500Color,
            ),
          ],
        ).padding(all: 12),
      ),
    ).decorated(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 2),
        )
      ],
    );
  }
}
