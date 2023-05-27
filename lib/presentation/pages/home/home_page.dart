import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../notifiers/room/room_detail_notifier.dart';
import '../../widgets/rooms/room_card.dart';
import '../../widgets/study_chip.dart';
import '../../widgets/study_icons.dart';
import 'viewmodels/home_viewmodel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(134),
        child: SafeArea(
          child: Column(
            children: [
              _buildSearchAndNotifications().padding(horizontal: 16, top: 16),
              const SizedBox(height: 16),
              _buildFilterChips().padding(horizontal: 16),
              const SizedBox(height: 16),
            ],
          ).border(bottom: 1, color: grey100Color),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 16,
          bottom: MediaQuery.of(context).padding.bottom + 32,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(roomDetailNotifier(1));

              return RoomCard(
                onPressed: () {
                  Navigator.pushNamed(context, '/room-detail');
                },
                imageUrl:
                    'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1694&q=80',
                title: 'Karuna Space',
                location: 'Dago, Bandung',
                distance: 2,
                price: 30000,
                hourlyRate: 3,
                stars: 4.8,
                reviews: 84,
                isWishlisted: ref.read(roomDetailNotifier(1)).isWishlisted,
                wishlistOnPressed: () {
                  state.toggleWishlist(context);
                },
              );
            },
          ).padding(horizontal: 16),
          const SizedBox(height: 40),
          Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(roomDetailNotifier(2));

              return RoomCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1463797221720-6b07e6426c24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1771&q=80',
                title: 'Naiyana Space',
                location: 'Buahbatu, Bandung',
                distance: 0.9,
                price: 30000,
                discountedPrice: 20000,
                hourlyRate: 3,
                stars: 4.5,
                reviews: 65,
                isWishlisted: ref.read(roomDetailNotifier(2)).isWishlisted,
                wishlistOnPressed: () {
                  state.toggleWishlist(context);
                },
              );
            },
          ).padding(horizontal: 16),
          const SizedBox(height: 40),
          Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(roomDetailNotifier(3));

              return RoomCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1542181961-9590d0c79dab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
                title: 'Shanti Space',
                location: 'Buahbatu, Bandung',
                distance: 0.6,
                price: 25000,
                hourlyRate: 3,
                stars: 4.6,
                reviews: 59,
                isWishlisted: ref.read(roomDetailNotifier(3)).isWishlisted,
                wishlistOnPressed: () {
                  state.toggleWishlist(context);
                },
              );
            },
          ).padding(horizontal: 16),
        ],
      ),
    );
  }

  Row _buildFilterChips() {
    return Row(
      children: [
        StudyChip(
          onPressed: () {
            if (ref.watch(homeViewModel).isChipSelected(HomeChip.promo)) {
              ref.read(homeViewModel).changeSelectedChip(HomeChip.unselected);
              return;
            }

            ref.read(homeViewModel).changeSelectedChip(HomeChip.promo);
          },
          selected: ref.watch(homeViewModel).isChipSelected(HomeChip.promo),
          label: 'Promo',
        ),
        const SizedBox(width: 12),
        StudyChip(
          onPressed: () {
            if (ref.watch(homeViewModel).isChipSelected(HomeChip.terdekat)) {
              ref.read(homeViewModel).changeSelectedChip(HomeChip.unselected);
              return;
            }

            ref.read(homeViewModel).changeSelectedChip(HomeChip.terdekat);
          },
          selected: ref.watch(homeViewModel).isChipSelected(HomeChip.terdekat),
          label: 'Terdekat',
        ),
        const SizedBox(width: 12),
        StudyChip(
          onPressed: () {
            if (ref.watch(homeViewModel).isChipSelected(HomeChip.termurah)) {
              ref.read(homeViewModel).changeSelectedChip(HomeChip.unselected);
              return;
            }

            ref.read(homeViewModel).changeSelectedChip(HomeChip.termurah);
          },
          selected: ref.watch(homeViewModel).isChipSelected(HomeChip.termurah),
          label: 'Termurah',
        ),
      ],
    );
  }

  Row _buildSearchAndNotifications() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                blurRadius: 8,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Cari Space',
              hintStyle: TextStyle(
                color: grey500Color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                StudyIcons.materialSymbolsSearchRounded,
                color: grey700Color,
              ),
            ),
            textInputAction: TextInputAction.search,
          ).padding(right: 16),
        ).expanded(),
        const SizedBox(width: 16),
        InkResponse(
          onTap: () {},
          child: const Icon(
            StudyIcons.materialSymbolsNotificationsRounded,
            color: grey700Color,
          ),
        ),
      ],
    );
  }
}
