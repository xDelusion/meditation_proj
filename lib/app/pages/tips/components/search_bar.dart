import 'package:explained_full/app/pages/tips/models/tips.dart';
import 'package:explained_full/app/pages/tips/provider/tips_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearchBar extends StatefulWidget {
  MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  // late final TipsModel tipsModelInstance;

  // List<TipsData> searchResults = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _initializeData();
  // }

  // Future<void> _initializeData() async {
  //   final tipsProvider = context.read<TipsProvider>();

  //   // Assume getTips() returns a Future<List<TipsData>>
  //   final tipsData = await tipsProvider.getTips();

  //   setState(() {
  //     tipsModelInstance = TipsModel(tipsData: tipsData);
  //   });
  // }

  // void onSearchField(String query) {
  //   setState(() {
  //     if (query.isNotEmpty) {
  //       searchResults = tipsModelInstance.tipsData
  //           .where(
  //               (item) => item.text.toLowerCase().contains(query.toLowerCase()))
  //           .toList();
  //     } else {
  //       // Clear the search results when the query is empty
  //       searchResults.clear();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchBar(
              onChanged: (query) {
                context.read<TipsProvider>().filterTips(query);
              },
              hintText: 'Search ...',
              constraints: BoxConstraints(maxWidth: 350, minHeight: 45),
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              )),
          SizedBox(height: 15),
          // if (searchResults.isNotEmpty)
          //   Expanded(
          //     child: ListView.builder(
          //       itemCount: searchResults.length,
          //       itemBuilder: (context, index) {
          //         return ListTile(
          //           contentPadding:
          //               EdgeInsets.symmetric(vertical: 8, horizontal: 28),
          //           leading: Text(searchResults[index].author),
          //           title: Text(searchResults[index].text),
          //         );
          //       },
          //     ),
          //   ),
        ],
      ),
    );
  }
}
