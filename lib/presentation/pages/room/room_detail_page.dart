import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../../infrastructures/models/food.dart';
import '../../widgets/food/food_menu_item.dart';
import '../../widgets/rooms/room_space_type.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/secondary_button.dart';
import '../../widgets/study_icon_button.dart';
import '../../widgets/study_icons.dart';
import 'room_select_time_page.dart';
import 'viewmodel/room_detail_viewmodel.dart';

class RoomDetailPage extends ConsumerStatefulWidget {
  const RoomDetailPage({super.key});

  @override
  ConsumerState<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends ConsumerState<RoomDetailPage> {
  int _sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rp10.000',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text('/1 jam'),
              ],
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/book');
              },
              label: 'Booking Sekarang',
              enabled: ref.watch(roomDetailViewModel).checkIn != null &&
                  ref.watch(roomDetailViewModel).selectedSpace !=
                      SpaceType.unselected,
              verticalPadding: 8.5,
            ),
          ],
        ),
      ).padding(horizontal: 20, vertical: 12).decorated(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            offset: const Offset(0, -2),
            blurRadius: 2,
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        initialPage: _sliderIndex,
                        autoPlay: true,
                        height: size.width - 40,
                        viewportFraction: 1,
                        onPageChanged: (index, _) {
                          setState(() {
                            _sliderIndex = index;
                          });
                        },
                      ),
                      items: [
                        'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1694&q=80',
                        'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1694&q=80',
                        'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1694&q=80',
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: size.width,
                              height: size.width,
                              decoration: const BoxDecoration(
                                color: grey300Color,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1694&q=80',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: _sliderIndex,
                      count: 3,
                      effect: WormEffect(
                        activeDotColor: ocean500Color,
                        dotColor: Colors.black.withOpacity(.4),
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ).padding(bottom: 12),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Karuna Space',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ).padding(horizontal: 20),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      StudyIcons.materialSymbolsLocationOnRounded,
                      size: 20,
                      color: ocean500Color,
                    ),
                    const SizedBox(width: 4),
                    // text inline with InkResponse
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: grey800Color,
                          fontFamily: 'General Sans',
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'Jl. Dago Bandung No. 110, Kecamatan Bandung, Kota Bandung, Jawa Barat  ',
                          ),
                          TextSpan(
                            text: 'Lihat di Map',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ocean500Color,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ).expanded(),
                  ],
                ).padding(horizontal: 20),
                const SizedBox(height: 16),
                _buildGeneralInfo().padding(horizontal: 20),
                const SizedBox(height: 16),
                SecondaryButton(
                  onPressed: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: _buildModalBottomSheet,
                    );
                  },
                  label: 'Lihat menu makanan & minuman',
                  verticalPadding: 8.5,
                ).constrained(width: size.width).padding(horizontal: 20),
                const SizedBox(height: 16),
                const Divider(color: grey100Color, thickness: 1, height: 1)
                    .padding(horizontal: 20),
                const SizedBox(height: 16),
                const Text(
                  'Pilih tipe space',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ).padding(horizontal: 20),
                const SizedBox(height: 8),
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    RoomSpaceType(
                      onPressed: () {
                        ref
                            .read(roomDetailViewModel)
                            .selectSpaceType(SpaceType.hangout);
                      },
                      isSelected:
                          ref.watch(roomDetailViewModel).selectedSpace ==
                              SpaceType.hangout,
                      label: 'Hangout',
                      description: 'Max. 6 orang',
                      image:
                          'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1694&q=80',
                    ).padding(right: 12),
                    RoomSpaceType(
                      onPressed: () {
                        ref
                            .read(roomDetailViewModel)
                            .selectSpaceType(SpaceType.working);
                      },
                      isSelected:
                          ref.watch(roomDetailViewModel).selectedSpace ==
                              SpaceType.working,
                      label: 'Working',
                      description: 'Max. 4 orang',
                      image:
                          'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1694&q=80',
                    ),
                  ],
                ).height(191),
                const SizedBox(height: 16),
                const Text(
                  'Yang kamu dapatkan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ).padding(horizontal: 20),
                const SizedBox(height: 8),
                _buildFeaturesCard(
                  icon: StudyIcons.materialSymbolsFastfoodRounded,
                  label: 'Makanan & Minuman',
                ).padding(horizontal: 20),
                const SizedBox(height: 16),
                const Text(
                  'Fasilitas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ).padding(horizontal: 20),
                const SizedBox(height: 8),
                Wrap(
                  spacing: size.width * 0.040769,
                  runSpacing: 8,
                  children: [
                    _buildFeaturesCard(
                      icon: StudyIcons.materialSymbolsWcRounded,
                      label: 'Toilet',
                    ),
                    _buildFeaturesCard(
                      icon: StudyIcons.materialSymbolsLocalParkingRounded,
                      label: 'Parkir motor & mobil',
                    ),
                    _buildFeaturesCard(
                      icon: StudyIcons.materialSymbolsWifiRounded,
                      label: 'WiFi',
                    ),
                    _buildFeaturesCard(
                      icon: StudyIcons.materialSymbolsMosque,
                      label: 'Mushola',
                    ),
                  ],
                ).padding(horizontal: 20),
                const SizedBox(height: 16),
                const Divider(color: grey100Color, thickness: 1, height: 1)
                    .padding(horizontal: 20),
                const SizedBox(height: 16),
                const Text(
                  'Waktu check-in',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ).padding(horizontal: 20),
                const SizedBox(height: 8),
                if (ref.watch(roomDetailViewModel).checkIn != null)
                  _buildCheckinButton(
                    label: ref.watch(roomDetailViewModel).checkIn.toString(),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/room-detail/checkin',
                        arguments: RoomDetailCheckinArgs(
                            ref.watch(roomDetailViewModel).checkIn!),
                      );
                    },
                  ).padding(horizontal: 20)
                else
                  _buildCheckinButton(
                    label: 'Pilih waktu check-in',
                    onTap: () {
                      Navigator.pushNamed(context, '/room-detail/checkin');
                    },
                  ).padding(horizontal: 20),
                const SizedBox(height: 64),
              ],
            ),
          ),
          // AppBar
          _buildAppBar(),
        ],
      ),
    );
  }

  Widget _buildModalBottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 4,
            width: 64,
            decoration: BoxDecoration(
              color: grey100Color,
              borderRadius: BorderRadius.circular(120),
            ),
          ),
        ).padding(vertical: 8),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: ModalScrollController.of(context),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Menu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text(
                'Makanan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  return FoodMenuItem(
                    imageUrl: foodList[index].imageUrl,
                    title: foodList[index].title,
                    description: foodList[index].description,
                    price: foodList[index].price,
                  ).padding(bottom: 16);
                },
              ),
              const Text(
                'Minuman',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: beverageList.length,
                itemBuilder: (context, index) {
                  return FoodMenuItem(
                    imageUrl: beverageList[index].imageUrl,
                    title: beverageList[index].title,
                    description: beverageList[index].description,
                    price: beverageList[index].price,
                  ).padding(bottom: 16);
                },
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
      ],
    );
  }

  Widget _buildCheckinButton({
    required String label,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ).expanded(),
            const Icon(
              StudyIcons.materialSymbolsChevronRightRounded,
              color: ocean500Color,
            ),
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

  Widget _buildGeneralInfo() {
    final size = MediaQuery.of(context).size;

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Rating
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    StudyIcons.materialSymbolsStarRounded,
                    color: ocean500Color,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '4.8 (84)',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                'Rating',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ).width(size.width * 0.25),
          //
          const VerticalDivider(color: grey100Color, thickness: 1),
          // Jarak
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    StudyIcons.materialSymbolsLocationOnRounded,
                    color: ocean500Color,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '2.0 km',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                'Jarak',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ).width(size.width * 0.25),
          //
          const VerticalDivider(color: grey100Color, thickness: 1),
          // Menu
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    StudyIcons.materialSymbolsFastfoodRounded,
                    color: ocean500Color,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '8',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                'Menu',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ).width(size.width * 0.25),
        ],
      ).padding(all: 12).decorated(
            border: Border.all(width: 1, color: grey100Color),
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
    );
  }

  Widget _buildFeaturesCard({required IconData icon, required String label}) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: grey700Color),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: grey700Color),
        ),
      ],
    )
        .padding(left: 8, right: 4, vertical: 9.5)
        .constrained(height: size.width * 0.27 * 0.75, width: size.width * 0.27)
        .decorated(
          border: Border.all(width: 1, color: grey100Color),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StudyIconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: StudyIcons.materialSymbolsArrowBackRounded,
            padding: 4,
          ),
          StudyIconButton(
            onPressed: () {},
            icon: StudyIcons.materialSymbolsFavoriteOutlineRounded,
            activeIcon: StudyIcons.materialSymbolsFavoriteRounded,
            padding: 4,
          ),
        ],
      ).padding(vertical: 16, horizontal: 20),
    );
  }
}
