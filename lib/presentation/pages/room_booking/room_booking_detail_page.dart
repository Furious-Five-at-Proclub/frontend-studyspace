import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/secondary_button.dart';
import '../../widgets/study_icons.dart';

class RoomBookingDetailPage extends StatefulWidget {
  const RoomBookingDetailPage({super.key});

  @override
  State<RoomBookingDetailPage> createState() => _RoomBookingDetailPageState();
}

class _RoomBookingDetailPageState extends State<RoomBookingDetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(134),
        child: SafeArea(
          child: const Row(
            children: [
              BackButton(),
              Text(
                'Detail Booking',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ).padding(horizontal: 6).border(bottom: 1, color: grey100Color),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  child: const Icon(
                    StudyIcons.materialSymbolsCheckSmallRounded,
                    size: 48,
                    color: green500Color,
                  ).padding(all: 4),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Pembayaran Berhasil',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ],
            )
                .padding(all: 16)
                .decorated(color: green500Color)
                .constrained(width: size.width),
            const SizedBox(height: 16),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kode pemesanan',
                      style: TextStyle(
                        color: grey500Color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'ABC123DE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Tunjukkan kode QR atau kode pemesanan ke resepsionis pada saat check-in',
                      style: TextStyle(fontSize: 12, color: grey700Color),
                    ),
                  ],
                ).expanded(),
                const SizedBox(width: 12),
                Column(
                  children: [
                    QrImageView(
                      data: '1234567890',
                      version: QrVersions.auto,
                      size: 80,
                    ),
                    const SizedBox(height: 4),
                    InkResponse(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultBorderRadius),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Scan kode QR saat check-in',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  QrImageView(
                                    data: '1234567890',
                                    version: QrVersions.auto,
                                    size: 230,
                                  ),
                                  const SizedBox(height: 40),
                                  SecondaryButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    label: 'Tutup',
                                  ).constrained(width: size.width),
                                ],
                              ).padding(all: 20),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Lihat',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ocean500Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).padding(horizontal: 20),
            const SizedBox(height: 16),
            const Divider(thickness: 1, color: grey100Color, height: 0)
                .padding(horizontal: 20),
            const SizedBox(height: 16),
            const Text(
              'Lokasi',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: grey500Color,
              ),
            ).padding(horizontal: 20),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Karuna Space',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Jl. Dago Bandung No. 110, Kecamatan Bandung, Kota Bandung, Jawa Barat',
                      style: TextStyle(fontSize: 12, color: grey700Color),
                    )
                  ],
                ).expanded(),
              ],
            ).padding(horizontal: 20),
            const SizedBox(height: 16),
            const Text(
              'Tipe Space',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: grey500Color,
              ),
            ).padding(horizontal: 20),
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
            ).padding(horizontal: 20),
            const SizedBox(height: 20),
            const Text(
              'Waktu',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: grey500Color,
              ),
            ).padding(horizontal: 20),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  DateFormat('EEEE, dd MMMM yyyy')
                      .format(DateTime.now())
                      .toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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
            ).padding(horizontal: 20),
            const SizedBox(height: 16),
            const Divider(thickness: 1, color: grey100Color, height: 0)
                .padding(horizontal: 20),
            const SizedBox(height: 16),
            const Text(
              'Detail Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ).padding(horizontal: 20),
            const SizedBox(height: 16),
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
            )
                .padding(all: 12)
                .decorated(
                  border: Border.all(width: 1, color: grey100Color),
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                )
                .padding(horizontal: 20),
            const SizedBox(height: 16),
            const Divider(thickness: 1, color: grey100Color, height: 0)
                .padding(horizontal: 20),
            const SizedBox(height: 16),
            RoundedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              label: 'Lihat Ruangan Saya',
            ).padding(horizontal: 20).constrained(width: size.width),
            const SizedBox(height: 16),
            SecondaryButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              label: 'Kembali ke homepage',
            ).padding(horizontal: 20).constrained(width: size.width),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
