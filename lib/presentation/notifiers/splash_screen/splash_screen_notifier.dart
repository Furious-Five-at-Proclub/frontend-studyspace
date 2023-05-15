import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_notifier.freezed.dart';
part 'splash_screen_state.dart';

final splashScreenNotifier =
    StateNotifierProvider<SplashScreenNotifier, SplashScreenState>(
        (ref) => SplashScreenNotifier());

class SplashScreenNotifier extends StateNotifier<SplashScreenState> {
  SplashScreenNotifier() : super(const SplashScreenState.initial());

  void initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    
    // cek apakah user sudah login atau belum
    // TODO: baca dari shared preferences apakah user sudah login atau belum
    state = const SplashScreenState.signedOut();
  }
}