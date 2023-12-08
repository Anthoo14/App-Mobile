import 'package:delivery/src/Features/Domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import 'package:delivery/src/Features/Presentation/Profile/ChangePaymentsMethodsPage/View/Components/PaymentMethodsCard.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Utils/Helpers/Checkout/CheckoutHelper.dart';
import 'package:flutter/material.dart';
import '../../../../../../Base/Views/BaseView.dart';
import '../../../../../../Colors/Colors.dart';
import '../../../../../../Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import '../../../../../../Utils/Styles/BoxShadowDecoration.dart';

class ChangePaymentsMethodsContentView extends StatelessWidget with BaseView  {

  final PaymentMethodsEntity? paymentMethods;
  BaseViewStateDelegate? delegate;

  ChangePaymentsMethodsContentView({ Key? key,
                                     required this.paymentMethods,
                                     required this.delegate }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildListDelegate(
            [
              const SizedBox(height: 16),
              paymentMethods?.hasPaymentMethods() ?? false ? PaymentCardsView(paymentMethods: paymentMethods,
                                                                              delegate: delegate) : Container()
            ]
        ))
      ],
    );
  }
}

class PaymentCardsView extends StatelessWidget with BaseView, PaymentMethodCardViewDelegate {

  final PaymentMethodsEntity? paymentMethods;
  BaseViewStateDelegate? delegate;

  PaymentCardsView({ Key? key,
                     required this.paymentMethods,
                     required this.delegate }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecorationWithShadows(),
      width: getScreenWidth(context: context),
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text("These are the payment methods you've added.",
              style: TextStyle(fontSize: 15, color: accentColor)
          ),
          const SizedBox(height: 20),
          PaymentMethodCardsView(paymentMethods: paymentMethods, delegate: this),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  paymentMethodTapped({ required BuildContext context,
                        required PaymentMethodEntity? paymentMethod,
                        required PaymentMethodsTypes type }) {
    switch (paymentMethod?.type) {
      case "paypal":
        coordinator.showAddEditPaypalAccountPage(context: context,
                                                 isForEditing: true,
                                                 paymentMethod: paymentMethod,
                                                 viewStateDelegate: delegate);
        break;
      case "visa":
        coordinator.showAddEditCardPage(context: context,
                                        isForEditing: true,
                                        isForCreateAVisaCard: true,
                                        paymentMethod: paymentMethod,
                                        viewStateDelegate: delegate);
        break;
      case "mastercard":
        coordinator.showAddEditCardPage(context: context,
            isForEditing: true,
            isForCreateAVisaCard: false,
            paymentMethod: paymentMethod,
            viewStateDelegate: delegate);
        break;
      default:
        break;
    }
  }

}


