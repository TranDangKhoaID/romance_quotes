import 'package:flutter/material.dart';
import 'package:romance_quotes/app/helpers/db_quotes.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/presentation/favorite/component/favorite_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Map<String, dynamic>> journals = [];
  bool isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      journals = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yêu thích'),
        elevation: 0,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {
              SQLHelper.deleteAllItems();
              _refreshJournals();
            },
            icon: Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : journals.isEmpty
              ? const Center(
                  child: Text(
                    "Bạn chưa có câu nói yêu thích của mình!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: journals.length,
                  itemBuilder: (context, index) {
                    return FavoriteItem(
                      index: index,
                      content: journals[index]['content'],
                      author: journals[index]['author'],
                      onTap: () async {
                        await SQLHelper.deleteItem(journals[index]['id']);
                        _refreshJournals();
                      },
                    );
                  },
                ),
    );
  }
}
