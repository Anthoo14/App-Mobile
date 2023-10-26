import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/headers.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 40.0,
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      header_text(
                          texto: "Search", color: Colors.black, fontSize: 30.0)
                    ],
                  ),
                )),
            _searchInput(context)
          ]))
        ],
      ),
    );
  }
}

Widget _searchInput(BuildContext context) {
  return Container(
    height: 45.0,
    margin: const EdgeInsets.all(20.0),
    padding: const EdgeInsets.only(left: 5.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(15.0)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 5.0),
          prefixIcon: Icon(
            Icons.search,
            color: gris,
          ),
          hintText: 'Search',
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
