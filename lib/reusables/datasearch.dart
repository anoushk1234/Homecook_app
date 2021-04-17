import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/strings.dart';

List<String> recentRestaurants = ["x", "y", "z"]; //temp
List<String> restaurants = [
  "Johncy",
  "Barbeque nation",
  "Mainland china",
  "FishKa",
  "Radisson blu",
  "Zuri",
  "Mariott",
  "Club Mahindra"
]; //temp

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
    //actions for appbar
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, 'home');
        });

    //icons on left of app bar
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //show results
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //show suggestions
    final suggestions = query.isEmpty
        ? recentRestaurants
        : restaurants
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestions[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestions[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestions.length,
    );
  }
}

/*
Widget searchBar(){
  return showSearch(context: null, delegate: null)
}*/
