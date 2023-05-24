import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/themes/theme.dart';
import 'presentation/pages/authentication/login_page.dart';
import 'presentation/pages/authentication/register_page.dart';
import 'presentation/pages/authentication/register_verification_page.dart';
import 'presentation/pages/main_page.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/room/room_detail_page.dart';
import 'presentation/pages/room/room_select_time_page.dart';
import 'presentation/room_booking/room_booking_detail.dart';
import 'providers.dart';
import 'wrappers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferences.overrideWithValue(preferences),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        fontFamily: 'General Sans',
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            color: grey300Color,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: grey300Color),
          ),
        ),
        useMaterial3: false,
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          closeIconColor: Colors.white,
          contentTextStyle: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Scaffold(body: Wrapper()),
        '/home': (context) => const MainPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/register-verification': (context) => const RegisterVerificationPage(),
        '/room-detail': (context) => const RoomDetailPage(),
        '/room-detail/checkin': (context) => const RoomDetailCheckin(),
        '/room-detail/book': (context) => const RoomBookingDetail(),
      },
    );
  }
}
