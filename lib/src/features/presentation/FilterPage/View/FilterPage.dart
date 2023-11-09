import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';

import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

import 'Components/cuisines_filters.dart';
import 'Components/list_tile_checked.dart';
import 'Components/priceFilter.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  //SORT BY BOOLEN'S
  bool topRated = false;
  bool nearMe = true;
  bool costHighToLow = false;
  bool costLowToHigh = false;
  bool mostPopular = false;

  //FILTER BOOLEN'S
  bool openNow = false;
  bool creditCard = true;
  bool alcoholServed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Center(
            child: header_text(texto: 'Filters', fontWeight: FontWeight.w600)),
        leading: Container(
          padding: const EdgeInsets.only(top: 20, left: 10.0),
          child: header_text(
              texto: 'Reset', fontWeight: FontWeight.w500, fontSize: 17.0),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: const EdgeInsets.only(top: 20, right: 10.0),
                child: header_text(
                    texto: 'Done',
                    color: naranja,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0)),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: header_text(
                    texto: 'CUISINES',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CuisinesFilter()),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: header_text(
                    texto: 'SORT BY',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              _sortBy(),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: header_text(
                    texto: 'FILTER',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              _filterContainer(),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                child: header_text(
                    texto: 'PRICE',
                    color: gris,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              PriceFilter()
            ]),
          ),
        ],
      ),
    );
  }

  Widget _sortBy() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          ListTileCheck(
            texto: 'Top Rated',
            isActive: topRated,
            func: () {
              setState(() => topRated = !topRated);
            },
          ),
          ListTileCheck(
            texto: 'Nearest Me',
            isActive: nearMe,
            func: () {
              setState(() => nearMe = !nearMe);
            },
          ),
          ListTileCheck(
            texto: 'Cost High To Low',
            isActive: costHighToLow,
            func: () {
              setState(() => costHighToLow = !costHighToLow);
            },
          ),
          ListTileCheck(
            texto: 'Cost low To high',
            isActive: costLowToHigh,
            func: () {
              setState(() => costLowToHigh = !costLowToHigh);
            },
          ),
          ListTileCheck(
            texto: 'Most Popular',
            isActive: mostPopular,
            func: () {
              setState(() => mostPopular = !mostPopular);
            },
          ),
        ],
      ),
    );
  }

  Widget _filterContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          ListTileCheck(
            texto: 'Open Now',
            isActive: openNow,
            func: () {
              setState(() => openNow = !openNow);
            },
          ),
          ListTileCheck(
            texto: 'Credit Cards',
            isActive: creditCard,
            func: () {
              setState(() => creditCard = !creditCard);
            },
          ),
          ListTileCheck(
            texto: 'Alcohol Served',
            isActive: alcoholServed,
            func: () {
              setState(() => alcoholServed = !alcoholServed);
            },
          ),
        ],
      ),
    );
  }
}
