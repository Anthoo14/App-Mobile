import '../../../Data/Repositories/Collections/CollectionsRepository.dart';
import '../../Entities/Collections/CollectionsEntity.dart';

abstract class FetchCollectionUseCase {
  Future<CollectionsEntity> execute();
}

class DefaultFetchCollectionUseCase extends FetchCollectionUseCase {
  
  // * Dependencies
  final CollectionsRepository _collectionsRepository;

  DefaultFetchCollectionUseCase({ CollectionsRepository? collectionsRepository })
      : _collectionsRepository =
            collectionsRepository ?? DefaultCollectionsRepository();

  @override
  Future<CollectionsEntity> execute() async {
    final response = await _collectionsRepository.fetchCollections();
    return CollectionsEntity.fromMap(response.toMap());
  }
}
