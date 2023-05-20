import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/study_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: SafeArea(
          child: const Text(
            'Akun',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ).padding(all: 16).border(bottom: 1, color: grey100Color),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                    color: grey100Color,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1545696968-1a5245650b36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1664&q=80',
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'sijohn@gmail.com',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '+62 81234567890',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(StudyIcons.materialSymbolsEditRounded),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: grey100Color),
            const SizedBox(height: 16),
            _buildCardMenu(
              onTap: () {},
              label: 'Wishlist',
              leadingIcon: StudyIcons.materialSymbolsFavoriteRounded,
              trailingIcon: StudyIcons.materialSymbolsChevronRightRounded,
            ),
            const SizedBox(height: 16),
            _buildCardMenu(
              onTap: () {},
              label: 'Riwayat pembayaran',
              leadingIcon: StudyIcons.materialSymbolsHistoryRounded,
              trailingIcon: StudyIcons.materialSymbolsChevronRightRounded,
            ),
            const SizedBox(height: 16),
            _buildCardMenu(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      content: const Text('Are you sure you want to log out?'),
                      title: const Text('Confirm log out'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            Navigator.pushReplacementNamed(
                              context,
                              '/onboarding',
                            );
                          },
                          isDestructiveAction: true,
                          child: const Text('Log out'),
                        ),
                      ],
                    );
                  },
                );
              },
              label: 'Log out',
              leadingIcon: StudyIcons.materialSymbolsExitToAppRounded,
              color: Colors.red[700]!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardMenu({
    required String label,
    required IconData leadingIcon,
    IconData? trailingIcon,
    required Function() onTap,
    Color color = grey700Color,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        child: Row(
          children: [
            Icon(leadingIcon, color: color),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            const Spacer(),
            if (trailingIcon != null) Icon(trailingIcon, color: ocean500Color),
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
