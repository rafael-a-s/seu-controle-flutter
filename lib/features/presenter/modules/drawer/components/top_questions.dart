import 'package:clean_architeture_flutter/features/core/components/app_settings_tile.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopQuestions extends StatelessWidget {
  const TopQuestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDefaults.padding / 2),
        Text(
          'Top Questions',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppDefaults.padding / 2),
        AppSettingsListTile(
          label: 'How do I return my Items',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
        AppSettingsListTile(
          label: 'How to use collection point?',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
        AppSettingsListTile(
          label: 'What is Grocery?',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
        AppSettingsListTile(
          label: 'How can i add new delivery address?',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
        AppSettingsListTile(
          label: 'How can i avail Sticker Price?',
          trailing: SvgPicture.asset(AppIcons.right),
        ),
      ],
    );
  }
}
