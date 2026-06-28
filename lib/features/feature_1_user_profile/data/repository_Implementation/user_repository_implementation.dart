import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/data/data_sources/user_remote_datasource.dart';
import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/data/models/user_model.dart';
import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/domain/entities/entity.dart';
import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/domain/repository/repository.dart';

//ConcreteImplementation
class UserRepositoryImplementation implements UserRepository {
  final UserRemoteDatasource remoteDatasource;

  //Dependency injection.The repository receives the datasource.
  UserRepositoryImplementation(this.remoteDatasource);

  @override
  Future<User> getUserProfile() async {
    //get raw data
    final data = await remoteDatasource.getUserProfile();

    //convert raw data into Model
    final userModel = UserModel.fromJson(data);

    //return entity
    return userModel.toUserEntity();
  }
}
