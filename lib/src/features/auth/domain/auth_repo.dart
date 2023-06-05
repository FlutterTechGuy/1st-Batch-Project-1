abstract class AuthRepo {
  
  Future login({
    required String email,
    required String password,
  });


  Future register({
  
    required String email,
    required String password,
  });
}
