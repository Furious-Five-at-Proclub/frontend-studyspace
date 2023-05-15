part of 'splash_screen_notifier.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.initial() = _Initial;
  const factory SplashScreenState.signedIn() = _SignedIn;
  const factory SplashScreenState.signedOut() = _SignedOut;
}