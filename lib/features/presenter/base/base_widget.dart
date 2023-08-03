import 'package:clean_architeture_flutter/app_widget.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseWidget extends HookConsumerWidget {
  final Widget child;

  const BaseWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arquitetura Rafael'),
        actions: [
          IconButton(
            onPressed: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                ref.read(appWidgetControllerProvider.notifier).changeTheme();
              });
            },
            icon: const Icon(Icons.nightlight),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
