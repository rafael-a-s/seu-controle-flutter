import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSubTotalMonthlyComponent extends StatefulWidget {
  const CardSubTotalMonthlyComponent({super.key});

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
              Text(
                "R\$ 700,00",
                style: AppDefaults.textStyleBalance,
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
