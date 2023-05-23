import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../core/themes/theme.dart';
import '../notifiers/bottom_nav/bottom_nav_notifier.dart';
import '../widgets/study_icons.dart';
import 'home/home_page.dart';
import 'myroom/myroom_page.dart';
import 'profile/profile_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bottomNavNotifier);

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      body: PageView(
        controller: state.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          MyRoomPage(),
          ProfilePage(),
        ],
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          state.changeIndex(index);
        },
        currentIndex: state.index,
        backgroundColor: Colors.white,
        selectedItemColor: ocean500Color,
        unselectedItemColor: grey500Color,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: ocean500Color,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: grey500Color,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(StudyIcons.materialSymbolsHomeRounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(StudyIcons.materialSymbolsSensorDoorRounded),
            label: 'Ruangan Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(StudyIcons.materialSymbolsPerson),
            label: 'Akun',
          ),
        ],
      ).boxShadow(
        color: Colors.black.withOpacity(.08),
        offset: const Offset(0, -2),
        blurRadius: 2,
      ),
    );
  }
}
