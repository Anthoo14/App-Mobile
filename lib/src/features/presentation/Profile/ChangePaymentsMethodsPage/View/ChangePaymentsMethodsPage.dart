import 'package:delivery/src/Features/Domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import 'package:delivery/src/Features/Presentation/Error/ErrorView.dart';
import 'package:delivery/src/Features/Presentation/Profile/ChangePaymentsMethodsPage/View/Components/ChangePaymentsMethodsContentView.dart';
import 'package:delivery/src/Features/Presentation/Profile/ChangePaymentsMethodsPage/View/Components/PaymentMethodsCard.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/UserStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/Checkout/CheckoutHelper.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:delivery/src/Utils/Styles/BoxShadowDecoration.dart';
import 'package:flutter/material.dart';
import 'package:delivery/src/Base/Views/BaseView.dart';
import '../../../../../Colors/Colors.dart';

class ChangePaymentsMethodsPage extends StatefulWidget {
  const ChangePaymentsMethodsPage({Key? key}) : super(key: key);

  @override
  State<ChangePaymentsMethodsPage> createState() =>
      _ChangePaymentsMethodsPageState();
}

class _ChangePaymentsMethodsPageState extends State<ChangePaymentsMethodsPage> with BaseView, BaseViewStateDelegate {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FooterView(delegate: this),
        appBar: AppBar(
            title: const Text("Payment Methods", style: TextStyle(fontSize: 17, color: Colors.black)),
            backgroundColor: white,
            elevation: 0.4,
            leading: Builder(
              builder: (BuildContext context) {
                return const BackButtonView(color: Colors.black);
              },
            )),
        body: FutureBuilder(
            future: (context).getPaymentMethods(),
            builder: (BuildContext context, AsyncSnapshot<PaymentMethodsEntity?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  if (snapshot.hasData && snapshot.data != null) {
                    return ChangePaymentsMethodsContentView(paymentMethods: snapshot.data, delegate: this);
                  } else {
                    return ErrorView();
                  }
                default:
                  return loadingView;
              }
            }));
  }

  @override
  void onChange() {
    print("+++++++++ onChange");
    setState(() {});
  }
}

class FooterView extends StatelessWidget with BaseView, PaymentMethodCardViewDelegate {

  BaseViewStateDelegate? delegate;

  FooterView({ Key? key, required this.delegate }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecorationWithShadows(),
      width: getScreenWidth(context: context),
      height: 220,
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          PaymentMethodCardView(defaultTitle: 'Añadir nueva cuenta de Paypal',
                                defaultPaymentMethod: PaymentMethodsTypes.paypal,
                                delegate: this),
          PaymentMethodCardView(defaultTitle: 'Añadir nueva tarjeta Visa',
                                defaultPaymentMethod: PaymentMethodsTypes.visa,
                                delegate:this),
          PaymentMethodCardView(defaultTitle: 'Añadir nueva tarjeta Mastercard',
                                defaultPaymentMethod: PaymentMethodsTypes.mastercard,
                                delegate: this)
        ],
      ),
    );
  }

  @override
  paymentMethodTapped({ required BuildContext context,
                        required PaymentMethodEntity? paymentMethod,
                        required PaymentMethodsTypes type }) {
    switch (type) {
      case PaymentMethodsTypes.paypal:
        coordinator.showAddEditPaypalAccountPage(context: context,
                                                 isForEditing: false,
                                                 viewStateDelegate: delegate);
        break;
      case PaymentMethodsTypes.visa:
        coordinator.showAddEditCardPage(context: context,
                                        isForEditing: false,
                                        isForCreateAVisaCard: true,
                                        viewStateDelegate: delegate);
        break;
      case PaymentMethodsTypes.mastercard:
        coordinator.showAddEditCardPage(context: context,
                                        isForEditing: false,
                                        isForCreateAVisaCard: false,
                                        viewStateDelegate: delegate);
        break;
      default:
        break;
    }
  }
}