import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/domain/entities/entity.dart';

abstract class UserRepository {
  Future<User> getUserProfile();
}
