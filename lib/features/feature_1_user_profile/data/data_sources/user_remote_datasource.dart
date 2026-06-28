class UserRemoteDatasource {
  //API request---Dio,http,retrofit,firebase etc goes here.

  //Fake API
  Future<Map<String, dynamic>> getUserProfile() async {
    await Future.delayed(const Duration(seconds: 3));
    return {"id": 1, "name": "Jackson", "email": "jackson.gmail.com"};
  }
}
