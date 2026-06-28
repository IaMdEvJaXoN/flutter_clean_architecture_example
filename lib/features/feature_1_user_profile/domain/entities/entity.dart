//This class represents a user in the business(a business object or simply a user).

class User {
  //User data fields
  final int id;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  }); //Automatic assignment

}
