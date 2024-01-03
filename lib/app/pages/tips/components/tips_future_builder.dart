import 'package:explained_full/app/pages/tips/models/tips.dart';
import 'package:explained_full/app/pages/tips/components/tips_listview.dart';
import 'package:explained_full/app/pages/tips/provider/tips_provider.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TipsFutureBuilder extends StatelessWidget {
  TipsFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<TipsProvider>().getTips(),
      builder: (context, AsyncSnapshot<List<TipsData>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          // Handle errors, e.g., show an error message.
          printError("Error: ${snapshot.error}");
          return Center(
            child: Text('Error loading data'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Handle the case when there is no data
          return Center(
            child: Text('No data available'),
          );
        }

        return TipsListView();
      },
    );
  }
}
