import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

import '../../../../../Colors/colors.dart';
import '../../../commons_widgets/Cards/favourites_card.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Text(''),
            backgroundColor: blanco,
            centerTitle: true,
            title: header_text(
                texto: 'My favourites',
                color: primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  favouritesCard(
                      context: context,
                      title: "Prueba 1 restaurant",
                      subTitle: "Descripcion del restaurant",
                      review: "4.5",
                      rating: "230 rating",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavourite: true,
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1484723091739-30a097e8f929?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YnJlYWtmYXN0fGVufDB8fDB8fHww')),
                  favouritesCard(
                      context: context,
                      title: "Prueba 1 restaurant",
                      subTitle: "Descripcion del restaurant",
                      review: "4.5",
                      rating: "230 rating",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavourite: false,
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1484723091739-30a097e8f929?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YnJlYWtmYXN0fGVufDB8fDB8fHww')),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
