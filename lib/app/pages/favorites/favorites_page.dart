import 'package:explained_full/app/pages/favorites/components/favorites_listview.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.amber.shade200,
      ),
      body: FavoritesListView(),
    );
  }
}
