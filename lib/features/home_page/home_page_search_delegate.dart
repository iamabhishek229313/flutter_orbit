
import 'package:flutter/material.dart';

class JobSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: new Icon(Icons.clear), onPressed: () {
      query = "" ;
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(color: Colors.red);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(color: Colors.green);
  }
}
