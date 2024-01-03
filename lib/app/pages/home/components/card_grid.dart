import 'package:flutter/material.dart';
import 'package:explained_full/app/pages/home/models/cards.dart';
import 'package:go_router/go_router.dart';

class CardGrid extends StatelessWidget {
  CardGrid({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: cardData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Handle tap on the card (you can navigate to the corresponding route)
                context.push(cardData[index].route);
              },
              child: Card(
                color: Colors.blueGrey.shade100,
                child: Center(
                  child: Text(
                    cardData[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
