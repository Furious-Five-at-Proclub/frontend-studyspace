import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/rounded_button.dart';
import 'viewmodels/register_viewmodel.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar akun',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            const Text(
              'Nama Lengkap',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan nama lengkap',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan alamat email',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextField(
              obscureText: ref.watch(registerViewModel).isObscured,
              decoration: InputDecoration(
                hintText: 'Masukkan password',
                suffixIcon: IconButton(
                  onPressed: ref.read(registerViewModel).toggleObscure,
                  icon: Icon(ref.watch(registerViewModel).isObscured
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'No. Handphone',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan nomor handphone',
              ),
            ),
            const SizedBox(height: 24),
            if (!ref.read(registerViewModel).isLoading)
              RoundedButton(
                onPressed: () {
                  ref.read(registerViewModel).register(context);
                },
                label: 'Daftar',
              ).constrained(width: MediaQuery.of(context).size.width)
            else
              const RoundedButton(
                enabled: false,
                label: 'Loading...',
              ).constrained(width: MediaQuery.of(context).size.width),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Sudah mempunyai akun?'),
                const SizedBox(width: 4),
                InkResponse(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
