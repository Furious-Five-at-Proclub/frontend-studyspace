import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_space/presentation/widgets/study_icons.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/rounded_button.dart';
import 'viewmodels/login_viewmodel.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();

    ref.read(loginViewModel);
  }

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
              'Masuk',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            const Text(
              'Email atau No. Handphone',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan alamat email atau No. HP',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextField(
              obscureText: ref.watch(loginViewModel).isObscured,
              decoration: InputDecoration(
                hintText: 'Masukkan password',
                suffixIcon: IconButton(
                  onPressed: ref.read(loginViewModel).toggleObscure,
                  icon: Icon(ref.watch(loginViewModel).isObscured
                      ? StudyIcons.materialSymbolsVisibilityOffRounded
                      : StudyIcons.materialSymbolsVisibilityRounded),
                ),
              ),
            ),
            const SizedBox(height: 24),
            InkResponse(
              onTap: () {},
              child: const Text(
                'Lupa Password?',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (!ref.read(loginViewModel).isLoading)
              RoundedButton(
                onPressed: () {
                  ref.read(loginViewModel).login(context);
                },
                label: 'Masuk',
              ).constrained(width: MediaQuery.of(context).size.width)
            else
              const RoundedButton(
                enabled: false,
                label: 'Loading...',
              ).constrained(width: MediaQuery.of(context).size.width),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Belum mempunyai akun?'),
                const SizedBox(width: 4),
                InkResponse(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'Daftar Akun',
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
