import 'dart:async';

import 'package:delivery/src/Features/Domain/Entities/Order/OrderEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Domain/UseCases/Places/FavouritesPlacesUseCase/FavouritesPlacesUseCase.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';

abstract class PlaceDetailViewModelInput {
  late PlaceDetailEntity place;

  dispose();
  favouriteIconTapped(bool isTapped);
  addProductToOrder({required ProductOrderEntity product});
  removeProductToOrder({required ProductOrderEntity product});
  bool isProductInOrder({required String productId});
  int getAmountOfProductInOrder({required String productId});
  updateAmountToProductInOrder({required String productId, required int amount});
}

abstract class PlaceDetailViewModelOutput {
  final StreamController<bool> _isUserFavouritePlaceController =
      StreamController<bool>();
  Stream<bool> get isUserFavouritePlaceStream =>
      _isUserFavouritePlaceController.stream;

  final StreamController<OrderEntity> _orderStreamController =
      StreamController<OrderEntity>();
  Stream<OrderEntity> get orderStream => _orderStreamController.stream;
}

abstract class PlaceDetailViewModel
    implements PlaceDetailViewModelInput, PlaceDetailViewModelOutput {}

class DefaultPlaceDetailViewModel extends PlaceDetailViewModel {
  @override
  late PlaceDetailEntity place;

  @override
  final StreamController<bool> _isUserFavouritePlaceController =
      StreamController<bool>();

  @override
  final StreamController<OrderEntity> _orderStreamController =
      StreamController<OrderEntity>();

  @override
  Stream<OrderEntity> get orderStream => _orderStreamController.stream;

  late OrderEntity _order;

  @override
  Stream<bool> get isUserFavouritePlaceStream =>
      _isUserFavouritePlaceController.stream;

  late FavouritesPlacesUseCase _favouritesPlacesUseCase;

  DefaultPlaceDetailViewModel({ required this.place, 
                                FavouritesPlacesUseCase? favouritesPlacesUseCase }) {
    _favouritesPlacesUseCase =
        favouritesPlacesUseCase ?? DefaultFavouritesPlacesUseCase();
    _setEmptyOrder(place: place);
    _setIsUserFavouritePlace();
  }

  @override
  dispose() {
    _isUserFavouritePlaceController.close();
    _orderStreamController.close();
  }

  @override
  favouriteIconTapped(bool isTapped) async {
    await _favouritesPlacesUseCase.saveOrRemoveUserFromPlaceFavourites(
        placeId: place.placeId,
        localId: MainCoordinator.sharedInstance?.userUid ?? "",
        isFavourite: isTapped);
    _isUserFavouritePlaceController.add(isTapped);
  }

  @override
  addProductToOrder({ required ProductOrderEntity product }) async {
    _order.products.add(product);
    _updateOrder();
  }

  @override
  updateAmountToProductInOrder({ required String productId, required int amount }) {
    List<ProductOrderEntity> products = _order.products.map((product) {
      var newProduct = product;
      if (newProduct.id == productId) {
        newProduct.amount += amount;
      }
      return newProduct;
    }).toList();
    products.removeWhere((product) => product.amount == 0);
    _order.products = products;
    _updateOrder();
  }

  @override
  removeProductToOrder({required ProductOrderEntity product}) async {
    _order.products.remove(product);
    _updateOrder();
  }

  @override
  bool isProductInOrder({required String productId}) {
    return _order.products
        .where((productOrdered) => productOrdered.id == productId)
        .isNotEmpty;
  }

  @override
  int getAmountOfProductInOrder({required String productId}) {
    return _order.products
        .where((productOrdered) => productOrdered.id == productId)
        .first
        .amount;
  }
}

extension PrivateMethods on DefaultPlaceDetailViewModel {
  void _setIsUserFavouritePlace() {
    _favouritesPlacesUseCase
        .isUserFavouritePlace(
            localId: MainCoordinator.sharedInstance?.userUid ?? "",
            placeId: place.placeId)
        .then((value) {
      _isUserFavouritePlaceController.add(value);
    });
  }

  void _setEmptyOrder({required PlaceDetailEntity place}) {
    _order = OrderEntity.fromPlaceId(placeId: place.placeId);
    _updateOrder();
  }

  _updateOrder() {
    _order.updateTotalPrice();
    _orderStreamController.add(_order);
  }
}
