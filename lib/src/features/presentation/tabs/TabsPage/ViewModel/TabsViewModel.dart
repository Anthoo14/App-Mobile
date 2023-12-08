import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import '../../../../../Base/Views/BaseView.dart';
import '../../../../../Services/GeolocationService/Entities/GeoServiceEntities.dart';
import '../../../../Domain/UseCases/Geolocation/GeolocationUseCase.dart';

abstract class TabsViewModelInput {
  // Exposed Methods
  Future<Result<bool,Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}



// Crear ViewModel
abstract class TabsViewModel extends TabsViewModelInput with BaseViewModel {}

class DefaultTabsViewModel extends TabsViewModel {
  // Dependencies
  final GeolocationUseCase _geolocationUseCase;

  DefaultTabsViewModel({ GeolocationUseCase? geolocationUseCase })
      : _geolocationUseCase = geolocationUseCase ?? DefaultGeolocationUseCase();

  @override
  void initState({ required LoadingStateProvider loadingState }) {
    loadingStatusState = loadingState;
  }

  @override
  Future<Result<bool, Failure>> getCurrentPosition() async {

    return await _geolocationUseCase.getCurrentPosition().then( (result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(true);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

  Future<LocationPermissionStatus> getPermissionStatus() async {
    return await _geolocationUseCase.getPermissionStatus();
  }
}
