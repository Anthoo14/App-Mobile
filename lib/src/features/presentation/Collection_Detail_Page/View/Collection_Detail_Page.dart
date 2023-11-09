import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Cards/favourites_card.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

class CollectionsDetail extends StatelessWidget {
  const CollectionsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 230,
            backgroundColor: Colors.orange,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1535399831218-d5bd36d1a6b3?auto=format&fit=crop&q=80&w=1170&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 1.5),
                        borderRadius: BorderRadius.circular(0)),
                  ),
                  Center(
                    child: header_text(
                        texto: "Peruvian \n Restaurant",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return backButtton(context, Colors.white);
            }),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: header_text(
                        texto: "128 places",
                        color: const Color.fromRGBO(51, 58, 77, 1.0),
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0),
                  ),
                  Column(
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
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
