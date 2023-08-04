import 'package:clean_architeture_flutter/features/presenter/modules/home/widgets/card_home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.90,
      heightFactor: 0.8,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: const <Widget>[
          CardHome(title: 'Exemplo'),
          CardHome(title: 'Desafios'),
        ],
      ),
    );
  }
}
