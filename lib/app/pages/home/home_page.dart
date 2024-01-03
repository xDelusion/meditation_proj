import 'package:explained_full/app/pages/home/components/card_grid.dart';
import 'package:explained_full/app/shared/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('H O M E'),
              actions: [
                IconButton(
                    onPressed: () {
                      context.push('/favorites');
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.black,
                    ))
              ],
              backgroundColor: Colors.amber.shade200,
            ),
            body: CardGrid()));
  }
}
