import 'package:animated_text_lerp/animated_text_lerp.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardSubTotalMonthlyComponent extends StatefulWidget {
  final double subTotal;
  const CardSubTotalMonthlyComponent({required this.subTotal, super.key});

  @override
  State<CardSubTotalMonthlyComponent> createState() =>
      _CardSubTotalMonthlyComponentState();
}

class _CardSubTotalMonthlyComponentState
    extends State<CardSubTotalMonthlyComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: 170,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sub Total",
                style: AppDefaults.textPlaceholderStyleDefault,
              ),
              Text(
                "Quanto te \nsobra esse mês",
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.6),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedNumberText<double>(
                widget.subTotal, // int or double
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                style: AppDefaults.textStyleBalance,
                formatter: (value) => NumberFormat.currency(
                        locale: "pt_BR", name: "BRL", symbol: "R\$")
                    .format(value),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "15%",
                style: AppDefaults.textStylePorcent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
