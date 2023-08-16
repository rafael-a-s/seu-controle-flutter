import 'package:clean_architeture_flutter/app_widget.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arquitetura Flutter'),
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF6443BD),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Image.asset('./assets/image/logo.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Arquitetura Flutter",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Exemplo'),
              onTap: () => Modular.to.navigate('/home/exemplo/'),
            ),
            ListTile(
              title: const Text('Exemplo'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: const SizedBox(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
