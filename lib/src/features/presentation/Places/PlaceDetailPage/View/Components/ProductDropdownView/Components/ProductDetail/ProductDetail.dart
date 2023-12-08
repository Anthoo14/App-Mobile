import 'package:delivery/src/Features/Domain/Entities/Order/OrderEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/FABPlaceDetailView/FABPlaceDetailView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/AddProductsView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ExtrasSelectionFormView/OptionsSelectionFormView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ProductDescriptionView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ProductNameView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ProductPriceView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/TopBarView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:delivery/src/Utils/Helpers/Checkout/CheckoutHelper.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  PlaceDetailViewModel viewModel;
  PlaceProductEntity product;
  
  ProductDetailView({Key? key, required this.product, required this.viewModel})
      : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> with AddProductsViewDelegate, ExtraSelectionFormViewDelegate {
 
  late ProductOrderEntity _productForOrder;
  double get _totalPrice => _productForOrder.totalPrice * _amount.toDouble();
  int _amount = 1;

  @override
  Widget build(BuildContext context) {
    _setBaseProductForOrder();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FABRoundedRectangleView(
          text:
              'Añadir ${_amount} por ${CheckoutHelper.formatPriceInEuros(_totalPrice)}',
          onPressed: () {
            _updateProductForOrderAmount();
            widget.viewModel.addProductToOrder(product: _productForOrder);
            Navigator.of(context).pop();
          },
          isHidden: false),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  TopBarView(product: widget.product),
                  const SizedBox(height: 16),
                  ProductNameView(product: widget.product),
                  const SizedBox(height: 4),
                  ProductPriceView(product: widget.product),
                  const SizedBox(height: 16),
                  ProductDescriptionView(product: widget.product),
                  const SizedBox(height: 24),
                  widget.product.options.isEmpty
                      ? Container()
                      : Column(children: _getExtraSelectionFormViewListViews()),
                  const SizedBox(height: 24),
                  AddProductsView(delegate: this, amount: _amount),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  addAmount() {
    setState(() {
      _amount = _amount + 1;
    });
  }

  @override
  subtractAmount() {
    setState(() {
      if(_amount > 1) {
        _amount = _amount - 1;
      }
    });
  }

  @override
  updateProductForOrder({required ProductOrderEntity product}) {
    setState(() {
      _productForOrder = product;
    });
  }

  _setBaseProductForOrder() {
    _productForOrder = ProductOrderEntity(
        productPrice: widget.product.productPrice,
        amount: _amount,
        options: widget.product.options,
        id: widget.product.id,
        imgs: widget.product.imgs,
        productDescription: widget.product.productDescription,
        productName: widget.product.productName);
  }

  List<Widget> _getExtraSelectionFormViewListViews() {
    return widget.product.options
        .map((extra) => OptionsSelectionFormView(
            extra: extra,
            viewModel: widget.viewModel,
            product: _productForOrder,
            delegate: this))
        .toList();
  }

  _updateProductForOrderAmount() {
    _productForOrder.amount = _amount;
    widget.product.amount = _amount;
  }
}
