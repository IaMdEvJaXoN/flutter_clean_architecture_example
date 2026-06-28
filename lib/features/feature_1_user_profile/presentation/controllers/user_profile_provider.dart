//DataSource provider
import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/data/data_sources/user_remote_datasource.dart';
import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/data/repository_Implementation/user_repository_implementation.dart';
import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/domain/repository/repository.dart';
import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/domain/use_cases/get_user_profile_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//The use case receives the repository which is actually the repository implementation(Dependency inversion)

final userRemoteDataSourceProvider = Provider<UserRemoteDatasource>((Ref ref) {
  return UserRemoteDatasource();
});

//repository provider
//Dependency inversion.
//Riverpod creates repositoryImpl and exposes it as Repository.
final userRepositoryProvider = Provider<UserRepository>((Ref ref) {
  final dataSource = ref.read(
    userRemoteDataSourceProvider,
  ); //ref.read() gives the dependency once.It does not rebuild the widget.
  return UserRepositoryImplementation(dataSource);
});

//usecase provider
final getUserProfileUseCaseProvider = Provider<GetUserProfileUsecase>((
  Ref ref,
) {
  final repository = ref.read(userRepositoryProvider);
  return GetUserProfileUsecase(
    repository,
  ); //GetUserProfileUseUseCase receives the repository which is actually repositoryImpl.
});

//We now need something the UI can watch.
final userProfileProvider = FutureProvider((Ref ref) async {
  final useCase = ref.read(getUserProfileUseCaseProvider);
  return await useCase(); //This the purpose of using call() in the usecase in domain.
  //Usecase becomes an instance of the GetUserProfileUsecase class hence the object can be used as a function
  //to invoke the method inside the call() method.
});
