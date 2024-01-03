import 'package:explained_full/app/pages/meditation/components/meditation_listview.dart';
import 'package:explained_full/app/pages/meditation/providers/meditation_provider.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeditationFutureBuilder extends StatelessWidget {
  MeditationFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<MeditationProvider>().gettingMeditation(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Print the error to the console
          printError('Error: ${snapshot.error}');

          // You can also display an error message to the user
          return Center(
            child: Text('Error loading data. Please try again later.'),
          );
        } else {
          // Handle the case when data is successfully loaded
          // Access data using snapshot.data
          return MeditationListView();
        }
      },
    );
  }
}
