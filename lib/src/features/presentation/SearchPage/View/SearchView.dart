import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Cards/cardVertical.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Cards/populares_card.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/header_double.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

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
                icon: const Icon(
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
            _searchInput(context),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: headerDoubleText(
                  textHeader: 'Recent search', textAction: 'Clear all'),
            ),
            _sliderRecentSearch(),
            const SizedBox(height: 20.0),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: headerDoubleText(
                    textHeader: 'Recommend for you', textAction: '')),
            const SizedBox(height: 20.0),
            popularesCard(
                context: context,
                title: "Prueba 1 restaurant",
                subTitle: "Descripcion del restaurant",
                review: "4.5",
                rating: "230 rating",
                buttonText: 'Delivery',
                hasActionButton: false,
                image: const NetworkImage(
                    'https://images.unsplash.com/photo-1565958011703-44f9829ba187?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGZvb2R8ZW58MHx8MHx8fDA%3D')),
            popularesCard(
                context: context,
                title: "Prueba 2 restaurant",
                subTitle: "Descripcion del restaurant",
                review: "4.5",
                rating: "230 rating",
                buttonText: 'Delivery',
                hasActionButton: false,
                image: const NetworkImage(
                    'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGZvb2R8ZW58MHx8MHx8fDA%3D')),
            popularesCard(
                context: context,
                title: "Prueba 3 restaurant",
                subTitle: "Descripcion del restaurant",
                review: "4.5",
                rating: "230 rating",
                buttonText: 'Delivery',
                hasActionButton: false,
                image: const NetworkImage(
                    'https://images.unsplash.com/photo-1565299507177-b0ac66763828?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTF8fGZvb2R8ZW58MHx8MHx8fDA%3D')),
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

Widget _sliderRecentSearch() {
  return Container(
    margin: const EdgeInsets.only(top: 5.0),
    height: 190.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return cardVertical(
                context: context,
                width: 160.0,
                height: 120.0,
                image: const NetworkImage(
                    'https://images.unsplash.com/photo-1496412705862-e0088f16f791?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjZ8fGZvb2R8ZW58MHx8MHx8fDA%3D'),
                title: "Prueba 1 restaurant.",
                subTitle: "Descripcion del restaurant");
          },
        );
      },
    ),
  );
}
