import 'package:explained_full/app/pages/meditation/models/meditation.dart';
import 'package:explained_full/app/pages/meditation/providers/meditation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeditationListView extends StatelessWidget {
  MeditationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MeditationProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: context.watch<MeditationProvider>().meditationList.length,
          itemBuilder: (context, index) {
            Meditation currentMeditation =
                context.watch<MeditationProvider>().meditationList[index];

            return Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
              child: Card(
                child: ListTile(
                  title: Text(
                    currentMeditation.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    currentMeditation.file.toString(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
