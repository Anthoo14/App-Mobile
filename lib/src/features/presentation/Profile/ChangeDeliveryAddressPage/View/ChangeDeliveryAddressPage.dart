import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import 'package:delivery/src/Features/Presentation/Error/ErrorView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/FABPlaceDetailView/FABPlaceDetailView.dart';
import 'package:delivery/src/Features/Presentation/Profile/ChangeDeliveryAddressPage/View/Components/ChangeDeliveryAddressContentView.dart';
import 'package:delivery/src/Features/Presentation/Profile/ChangeDeliveryAddressPage/View/Components/DeliveryAddressListView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/UserStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:delivery/src/Utils/Styles/BoxShadowDecoration.dart';
import 'package:flutter/material.dart';
import '../../../../../Colors/Colors.dart';

class ChangeDeliveryAddressPage extends StatefulWidget {
  const ChangeDeliveryAddressPage({ Key? key }) : super(key: key);

  @override
  State<ChangeDeliveryAddressPage> createState() => _ChangeDeliveryAddressPageState();
}

class _ChangeDeliveryAddressPageState extends State<ChangeDeliveryAddressPage> with BaseView, BaseViewStateDelegate  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FABRoundedRectangleView(
            text: 'Add New Address',
            backgroundColor: orange,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            onPressed: () {
                coordinator.showAddEditDeliveryAddress(context: context,
                                                       viewStateDelegate: this,
                                                       isForEditing: false);
            },
            isHidden: false),
        appBar: AppBar(
            title: const Text("Address Book", style: TextStyle(fontSize: 17, color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0.4,
            leading: Builder(
              builder: (BuildContext context) {
                return const BackButtonView(color: Colors.black);
              },
            )),
        body: FutureBuilder(
          future: (context).getDeliveryAddressList(),
          builder: (BuildContext context, AsyncSnapshot<DeliveryAddressListEntity?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                if (snapshot.hasData && snapshot.data != null) {
                  return ChangeDeliveryAddressContentView(deliveryAddressEntity: snapshot.data,
                                                          viewStateDelegate: this);
                } else {
                  return ErrorView();
                }
              default:
                return loadingView;
            }
          }),
    );
  }

  @override
  void onChange() {
    print("onChange ++++++++++");
    setState(() {});
  }
}
