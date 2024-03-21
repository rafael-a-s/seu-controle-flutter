
import 'package:clean_architeture_flutter/features/start/model/rive_model.modelc.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({required this.title, required this.rive});
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
    title: "Home",
    rive: RiveModel(
      src: "assets/rive/icons_rive.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
    ),
  ),
  NavItemModel(
    title: "Home",
    rive: RiveModel(
      src: "assets/rive/icons_rive.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
    ),
  ),
  NavItemModel(
    title: "Home",
    rive: RiveModel(
      src: "assets/rive/icons_rive.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
    ),
  ),
];
