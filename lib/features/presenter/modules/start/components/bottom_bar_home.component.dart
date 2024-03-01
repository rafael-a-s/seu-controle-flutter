import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/components/animated_bar_bottom.componet.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/model/nav_item.modelc.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/model/rive_model.modelc.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BottomBarHomeComponent extends StatefulWidget {
  const BottomBarHomeComponent({super.key});

  @override
  State<BottomBarHomeComponent> createState() => _BottomBarHomeComponentState();
}

class _BottomBarHomeComponentState extends State<BottomBarHomeComponent> {
  List<SMIBool> riveIconsInputs = [];
  List<StateMachineController?> controllers = [];
  int selectNavItem = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56,
        padding: AppDefaults.padinngDefault,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.primaryOpacity,
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryOpacity,
              offset: Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomNavItems.length, (index) {
            final riveIcon = bottomNavItems[index].rive;

            return GestureDetector(
              onTap: () {
                animatedIcon(index);
                setState(() {
                  selectNavItem = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBarBottom(
                    isActive: index == selectNavItem,
                  ),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Opacity(
                      opacity: selectNavItem == index ? 1 : 0.5,
                      child: RiveAnimation.asset(
                        riveIcon.src,
                        artboard: bottomNavItems[index].rive.artboard,
                        onInit: (artboard) {
                          riveOnInit(artboard, riveIcon);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void riveOnInit(Artboard artboard, RiveModel riveIcon) {
    StateMachineController? controller = StateMachineController.fromArtboard(
        artboard, riveIcon.stateMachineName);

    artboard.addController(controller!);
    controllers.add(controller);

    riveIconsInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  void animatedIcon(int index) {
    riveIconsInputs[index].change(true);
    Future.delayed(const Duration(seconds: 1), () {
      riveIconsInputs[index].change(false);
    });
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }
}
