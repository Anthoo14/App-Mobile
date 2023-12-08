import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/TextFormField/CustomTextFormFields.dart';
import 'package:delivery/src/Utils/Styles/BoxShadowDecoration.dart';
import 'package:flutter/material.dart';

mixin DeliveryAddressViewDelegate {
  cardTapped({ required BuildContext context,
               required DeliveryAddressEntity deliveryAddressEntity});
}

class DeliveryAddressListView extends StatelessWidget with TextFormFieldDelegate {

  DeliveryAddressViewDelegate? delegate;
  DeliveryAddressListEntity? deliveryAddressListEntity;
  BaseViewStateDelegate? viewStateDelegate;

  DeliveryAddressListView({ Key? key,
                            required this.delegate,
                            required this.deliveryAddressListEntity,
                            required this.viewStateDelegate }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getDeliveryAddressWidgetList(context),
    );
  }

  List<Widget> getDeliveryAddressWidgetList(BuildContext context) {
    if (deliveryAddressListEntity == null) { return []; }

    return deliveryAddressListEntity?.deliveryAddressList.map( (deliveryAddressEntity) {
      return GestureDetector(
        onTap: () {
           delegate?.cardTapped(context: context,
                                deliveryAddressEntity: deliveryAddressEntity);
        },
        child: CustomTextFormField(
          delegate: this,
          hintext: '',
          textFormFieldType: CustomTextFormFieldType.email,
          decoration: defaultTextFieldDecoration,
          labelValue: deliveryAddressEntity.alias.toUpperCase(),
          initialValue: deliveryAddressEntity.street,
          enabled: false,
        ),
      );
    }).toList() ?? [];
  }

  @override
  onChanged({ required String newValue,
              required CustomTextFormFieldType customTextFormFieldType}) {
 
  }
}
