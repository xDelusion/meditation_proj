import 'package:explained_full/app/pages/tips/models/tips.dart';
import 'package:explained_full/app/pages/auth/models/user.dart';
import 'package:explained_full/app/pages/tips/provider/tips_provider.dart';
import 'package:explained_full/app/shared/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TipsListView extends StatelessWidget {
  TipsListView({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.read<AuthProvider>();
    final User? signedInUser = authProvider.signedInUser;
    return Consumer<TipsProvider>(
      builder: (context, value, child) => Expanded(
        child: ListView.builder(
          itemCount: context.watch<TipsProvider>().tipsData.length,
          itemBuilder: (context, index) {
            TipsData currentTip =
                context.watch<TipsProvider>().filteredTips[index];

            bool isCurrentUserAuthor =
                currentTip.author == signedInUser?.username;

            return Padding(
                padding:
                    EdgeInsets.only(top: 4, bottom: 1, right: 15, left: 15),
                child: Card(
                  child: ListTile(
                      title: Text(currentTip.author),
                      subtitle: Text(currentTip.text),
                      trailing: isCurrentUserAuthor
                          ? Wrap(children: [
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<TipsProvider>()
                                      .deleteTip(currentTip.id);
                                },
                                icon: Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<TipsProvider>()
                                      .deleteTip(currentTip.id);
                                },
                                icon: Icon(Icons.edit),
                              ),
                            ])
                          : null),
                ));
          },
        ),
      ),
    );
  }
}
