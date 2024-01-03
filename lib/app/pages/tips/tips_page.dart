import 'package:explained_full/app/pages/tips/components/dialogue_builder.dart';
import 'package:explained_full/app/pages/tips/components/tips_future_builder.dart';
import 'package:explained_full/app/pages/tips/provider/tips_provider.dart';
import 'package:explained_full/app/shared/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TipsPage extends StatelessWidget {
  TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: ElevatedButton(
              onPressed: () => dialogBuilder(context),
              child: Container(child: Text('+ Add a Tip')))),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<TipsProvider>().toggleSortOrder();
            },
            icon: Icon(Icons.sort),
          )
        ],
        title: Text('Tips'),
      ),
      body: Column(
        children: [
          // MySearchBar(),   //? *****************   S E A R C H   B A R
          TipsFutureBuilder()
        ],
      ),
    ));
  }
}
