import '../../../../Data/Repositories/Auth/UpdatePassword/UpdatePasswordRepository.dart';

abstract class UpdatePasswordUseCase {
  Future<void> execute({required String email});
}

class DefaultUpdatePasswordUseCase extends UpdatePasswordUseCase {
  
  // * Dependencies
  final UpdatePasswordRepository _updatePasswordRepository;

  DefaultUpdatePasswordUseCase({ UpdatePasswordRepository? updatePasswordRepository })
      : _updatePasswordRepository = updatePasswordRepository ?? DefaultUpdatePasswordRepository();

  @override
  Future<void> execute({ required String email }) {
    return _updatePasswordRepository.updatePassword(email: email);
  }
}
