import 'package:clean_architeture_flutter/features/core/components/app_settings_tile.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpTopics extends StatelessWidget {
  const HelpTopics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDefaults.padding),
        Text(
          'Topics',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppDefaults.padding / 2),
        AppSettingsListTile(
          label: 'My Account',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
        AppSettingsListTile(
          label: 'Payment and Wallet',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
        AppSettingsListTile(
          label: 'Shipping & Delivery',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
        AppSettingsListTile(
          label: 'Vouchers & Promotions',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
        AppSettingsListTile(
          label: 'Ordering',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
      ],
    );
  }
}
