import 'package:flutter/material.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/features/home/presentation/widgets/searchBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController _searchController = SearchController();

  List<String> searchResults = [
    "Pasta",
    "Pizza",
    "Salad",
    "Burger",
    "Sushi",
    "Tacos",
    "Soup",
    "Sandwich",
    "Steak",
    "Pancakes",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Search Recipes",
          style: TextStyle(color: AppColor.backGround),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchAnchor(
          viewBackgroundColor: Colors.white,
          isFullScreen: false,
          searchController: _searchController,
          builder: (BuildContext context, SearchController controller) {
            return SearchSection(
              onTap: () {
                controller.openView();
              },
            );
          },
          suggestionsBuilder: (
            BuildContext context,
            SearchController controller,
          ) {
            return searchResults
                .where(
                  (e) =>
                      controller.text.isEmpty ||
                      e.toLowerCase().contains(controller.text.toLowerCase()),
                )
                .map(
                  (e) => Container(
                    color: Colors.white,
                    child: ListTile(title: Text(e)),
                  ),
                );
          },
        ),
      ),
    );
  }
}
