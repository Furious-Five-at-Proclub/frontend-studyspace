import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/study_icons.dart';
import 'model/checkin.dart';
import 'viewmodel/checkin_notifier.dart';
import 'viewmodel/room_detail_viewmodel.dart';

class RoomDetailCheckinArgs {
  final CheckIn checkIn;

  RoomDetailCheckinArgs(this.checkIn);
}

class RoomDetailCheckin extends ConsumerStatefulWidget {
  const RoomDetailCheckin({super.key});

  @override
  ConsumerState<RoomDetailCheckin> createState() => _RoomDetailCheckinState();
}

class _RoomDetailCheckinState extends ConsumerState<RoomDetailCheckin> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments as RoomDetailCheckinArgs?;

    if (args != null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(checkInNotifier).selectCheckinDate(args.checkIn.date);
        ref.read(checkInNotifier).selectCheckinTime(args.checkIn.time);
        ref.read(checkInNotifier).selectCheckinDuration(args.checkIn.duration);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(134),
        child: SafeArea(
          child: const Row(
            children: [
              BackButton(),
              Text(
                'Pilih waktu check-in',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ).padding(horizontal: 6).border(bottom: 1, color: grey100Color),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: RoundedButton(
          onPressed: () {
            final checkIn = CheckIn(
              date: ref.watch(checkInNotifier).date,
              time: ref.watch(checkInNotifier).time,
              duration: ref.watch(checkInNotifier).duration,
            );

            ref.read(roomDetailViewModel).selectCheckIn(checkIn);

            Navigator.pop(context);
          },
          label: 'Konfirmasi',
          enabled: ref.watch(checkInNotifier).time.isNotEmpty,
        )
            .boxShadow(
              offset: const Offset(0, 2),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.2),
            )
            .padding(bottom: 16, horizontal: 20),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tanggal check-in',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _buildCheckinDate(
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: ref.read(checkInNotifier).date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                );

                ref.read(checkInNotifier).selectCheckinDate(selectedDate);
              },
              label: DateFormat('dd MMMM, yyyy')
                  .format(ref.watch(checkInNotifier).date),
            ),
            const SizedBox(height: 20),
            const Text(
              'Durasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _buildRadioDuration(
              onSelected: ref.read(checkInNotifier).selectCheckinDuration,
              value: CheckinDuration.onehour,
              label: '1 Jam',
              price: 10000,
            ),
            const SizedBox(height: 12),
            _buildRadioDuration(
              onSelected: ref.read(checkInNotifier).selectCheckinDuration,
              value: CheckinDuration.twohour,
              label: '2 Jam',
              price: 20000,
            ),
            const SizedBox(height: 12),
            _buildRadioDuration(
              onSelected: ref.read(checkInNotifier).selectCheckinDuration,
              value: CheckinDuration.threehour,
              label: '3 Jam',
              price: 30000,
            ),
            const SizedBox(height: 12),
            _buildRadioDuration(
              onSelected: ref.read(checkInNotifier).selectCheckinDuration,
              value: CheckinDuration.fourhour,
              label: '4 Jam',
              price: 40000,
            ),
            const SizedBox(height: 20),
            const Text(
              'Jam check-in',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                '10:00',
                '10:30',
                '11:00',
                '11:30',
                '12:00',
                '12:30',
                '13:00',
                '13:30',
                '14:00',
                '14:30',
                '15:00',
                '15:30',
                '16:00',
                '16:30',
                '17:00',
                '17:30',
                '18:00',
                '18:30',
                '19:00',
                '19:30',
                '20:00',
              ].map((time) {
                return _buildTimeChip(
                  onTap: () {
                    ref.read(checkInNotifier).selectCheckinTime(time);
                  },
                  enabled: time != '10:00',
                  isActive: ref.watch(checkInNotifier).time == time,
                  label: time,
                );
              }).toList(),
            ),
            SizedBox(height: 76 + MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeChip({
    required String label,
    required Function()? onTap,
    bool isActive = false,
    bool enabled = true,
  }) {
    final size = MediaQuery.of(context).size;

    if (!enabled) {
      return Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: grey500Color,
        ),
      )
          .center()
          .padding(all: 8)
          .ripple()
          .decorated(
            color: grey200Color,
            border: Border.all(width: 2, color: grey200Color),
            borderRadius: BorderRadius.circular(120),
          )
          .constrained(width: size.width / 3 - 12 - 10);
    }

    return Text(
      label,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    )
        .center()
        .padding(all: 8)
        .ripple()
        .decorated(
          color: isActive ? ocean50Color : Colors.transparent,
          border: Border.all(
              width: 2, color: isActive ? ocean500Color : grey100Color),
          borderRadius: BorderRadius.circular(120),
        )
        .constrained(width: size.width / 3 - 12 - 10)
        .gestures(onTap: onTap)
        .clipRRect(all: 120);
  }

  Widget _buildRadioDuration({
    required Function(CheckinDuration? value)? onSelected,
    required String label,
    required int price,
    required CheckinDuration value,
  }) {
    bool isSelected = ref.watch(checkInNotifier).duration == value;

    return Material(
      color: isSelected ? ocean50Color : Colors.transparent,
      borderRadius: BorderRadius.circular(120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: grey900Color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Rp$price',
                style: const TextStyle(
                  color: grey900Color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ).expanded(),
          Radio<CheckinDuration>(
            onChanged: onSelected,
            groupValue: ref.watch(checkInNotifier).duration,
            value: value,
            activeColor: ocean500Color,
          ),
        ],
      )
          .padding(left: 12)
          .ripple()
          .gestures(
            onTap: () {
              onSelected?.call(value);
            },
          )
          .clipRRect(all: 120)
          .decorated(
            border: Border.all(
              width: 2,
              color: isSelected ? ocean500Color : grey100Color,
            ),
            borderRadius: BorderRadius.circular(120),
          ),
    );
  }

  Widget _buildCheckinDate({
    required String label,
    required Function() onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        child: Row(
          children: [
            const Icon(
              StudyIcons.materialSymbolsCalendarMonthRounded,
              color: grey500Color,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: grey900Color,
              ),
              overflow: TextOverflow.ellipsis,
            ).expanded(),
            const Spacer(),
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
}
