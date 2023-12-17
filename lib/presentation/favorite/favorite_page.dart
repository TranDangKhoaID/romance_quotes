import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/app/storage/app_shared.dart';
import 'package:romance_quotes/data/fake_data/quotes_data.dart';
import 'package:romance_quotes/presentation/favorite/component/favorite_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yêu thích'),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              QuotesController.instance.deleteAllFavorites(context);
            },
            icon: Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: AppPreferences.instance.getFavorites().length,
        itemBuilder: (context, index) {
          return FavoriteItem(
            index: index,
            quotes: AppPreferences.instance.getFavorites()[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
