import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import 'package:delivery/src/Features/Presentation/Profile/ChangeDeliveryAddressPage/View/Components/DeliveryAddressListView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:delivery/src/Utils/Styles/BoxShadowDecoration.dart';
import 'package:flutter/material.dart';

class ChangeDeliveryAddressContentView extends StatelessWidget with DeliveryAddressViewDelegate, BaseView {

  DeliveryAddressListEntity? deliveryAddressEntity;
  BaseViewStateDelegate? viewStateDelegate;

  ChangeDeliveryAddressContentView({ Key? key,
                                     this.deliveryAddressEntity,
                                     this.viewStateDelegate }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildListDelegate(
            [
              const SizedBox(height: 16),
              deliveryAddressEntity?.hasDeliveryAddress() ?? false ? Container(
                decoration: getBoxDecorationWithShadows(),
                width: getScreenWidth(context: context),
                margin: const EdgeInsets.only(left: 16, right: 16),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    DeliveryAddressListView(delegate: this,
                                            deliveryAddressListEntity: deliveryAddressEntity,
                                            viewStateDelegate: viewStateDelegate)
                  ],
                ),
              ) : Container()
            ]
        ))
      ],
    );
  }

  @override
  cardTapped({ required BuildContext context,
               required DeliveryAddressEntity deliveryAddressEntity}) {
    coordinator.showAddEditDeliveryAddress(context: context,
                                           isForEditing: true,
                                           deliveryAddressEntity: deliveryAddressEntity,
                                           viewStateDelegate: viewStateDelegate);
  }
}
