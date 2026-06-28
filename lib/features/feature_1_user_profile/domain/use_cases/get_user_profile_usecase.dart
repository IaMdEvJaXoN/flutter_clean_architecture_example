import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/domain/entities/entity.dart';
import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/domain/repository/repository.dart';

class GetUserProfileUsecase {
  final UserRepository repository;
  GetUserProfileUsecase(this.repository); //Constructor dependency injection.
  //Someone else will inject the repository.
  //The usecase simply accepts it

  //call() is a special method that is built into the dart language.
  //It makes an object behave like a function.Instead of usecase.call(),we use just useCase()
  //The object itself becomes callable
  Future<User> call() async {
    return await repository.getUserProfile();
  }
}
