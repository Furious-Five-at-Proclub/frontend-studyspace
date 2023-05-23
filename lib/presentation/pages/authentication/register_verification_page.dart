import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/rounded_button.dart';

class RegisterVerificationPage extends ConsumerStatefulWidget {
  const RegisterVerificationPage({super.key});

  @override
  ConsumerState<RegisterVerificationPage> createState() =>
      _RegisterVerificationPageState();
}

class _RegisterVerificationPageState
    extends ConsumerState<RegisterVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          InkResponse(
            onTap: () {},
            child: const Center(
              child: Text(
                'Lewati',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ).padding(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verifikasi No. Handphone',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                Text(
                  'Masukkan kode verifikasi yang sudah dikirim ke nomor +62812 3456 7890',
                  style: TextStyle(fontSize: 16, color: Color(0xFF777777)),
                ),
                SizedBox(height: 24),
                Text(
                  'Kode Verifikasi',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 64),
            RoundedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacementNamed(context, '/home');
              },
              label: 'Verifikasi',
            ).constrained(width: MediaQuery.of(context).size.width),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Sudah mempunyai akun?'),
                const SizedBox(width: 4),
                InkResponse(
                  onTap: () {},
                  child: const Text(
                    'Kirim Ulang',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
