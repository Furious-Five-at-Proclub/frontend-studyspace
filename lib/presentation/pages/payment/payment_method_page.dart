import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../../infrastructures/models/payment.dart';
import '../../widgets/rounded_button.dart';
import 'viewmodel/payment_method_viewmodel.dart';

class PaymentMethodPageArgs {
  final Payment? selectedPayment;
  final Function(Payment selectedPayment) onConfirmed;

  const PaymentMethodPageArgs({
    required this.onConfirmed,
    this.selectedPayment,
  });
}

class PaymentMethodPage extends ConsumerStatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  ConsumerState<PaymentMethodPage> createState() => PaymentMethodPageState();
}

class PaymentMethodPageState extends ConsumerState<PaymentMethodPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments as PaymentMethodPageArgs;

    ref.read(paymentMethodViewModel).selectPayment(args.selectedPayment);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PaymentMethodPageArgs;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(134),
        child: SafeArea(
          child: const Row(
            children: [
              BackButton(),
              Text(
                'Metode Pembayaran',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ).padding(horizontal: 6).border(bottom: 1, color: grey100Color),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: RoundedButton(
          onPressed: () {
            final selectedPayment =
                ref.watch(paymentMethodViewModel).selectedPayment;

            if (selectedPayment != null) {
              args.onConfirmed(selectedPayment);

              Navigator.pop(context);
            }
          },
          label: 'Konfirmasi',
          enabled: ref.watch(paymentMethodViewModel).selectedPayment != null,
        )
            .boxShadow(
              offset: const Offset(0, 2),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.2),
            )
            .padding(bottom: 16, horizontal: 20),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'E-Wallet',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paymentList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return _buildPaymentRadio(paymentList[index]);
              },
            ),
            const SizedBox(height: 4),
            const Text(
              'QRIS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paymentQrisList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return _buildPaymentRadio(paymentQrisList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentRadio(Payment payment) {
    final selectedPayment = ref.watch(paymentMethodViewModel).selectedPayment;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/${payment.image}'),
              alignment: Alignment.centerLeft,
            ),
          ),
        ).expanded(),
        Radio<Payment>(
          activeColor: ocean500Color,
          value: payment,
          groupValue: ref.watch(paymentMethodViewModel).selectedPayment,
          onChanged: ref.read(paymentMethodViewModel).selectPayment,
        ),
      ],
    )
        .padding(left: 12, vertical: 1)
        .ripple()
        .decorated(
          color: selectedPayment == payment ? ocean50Color : Colors.white,
          border: Border.all(
            color: selectedPayment == payment ? ocean500Color : grey100Color,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(120),
        )
        .gestures(
          onTap: () {
            ref.read(paymentMethodViewModel).selectPayment(payment);
          },
        )
        .clipRRect(all: 120)
        .padding(bottom: 12);
  }
}
