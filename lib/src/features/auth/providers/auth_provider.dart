import 'package:flutter/cupertino.dart';
import 'package:flutter_interview_test/src/features/auth/domain/auth_repo_impl.dart';

class AuthProvider with ChangeNotifier {
  AuthRepoImpl? _repo;

  AuthProvider() {
    _repo = AuthRepoImpl();
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _loadingText = 'Please wait...';
  String get loadingText => _loadingText;

  /// [login] : this function will take email and password
  /// from user and logs them in the app
  Future<String> login(
      {required String email, required String password}) async {
    _isLoading = true;
    _loadingText = 'Logging in...';

    notifyListeners();
    String result = 'OK';

    try {
      final res = await _repo!.login(email: email, password: password);
      print(res);
    } catch (e) {
      result = e.toString();
    }

    _isLoading = false;
    notifyListeners();
    return result;
  }

  /// [register] : this function will take email and password
  /// from user and logs them in the app
  Future<String> register(
      {required String email, required String password}) async {
    _isLoading = true;
    _loadingText = 'Creating user...';

    notifyListeners();
    String result = 'OK';

    try {
      final res = await _repo!.register(email: email, password: password);
      print(res);
    } catch (e) {
      result = e.toString();
    }

    _isLoading = false;
    notifyListeners();
    return result;
  }

  Future<String> forgotPassword({required String email}) async {
    _isLoading = true;
    _loadingText = 'Please wait..';

    notifyListeners();
    String result = 'OK';

    try {
      final res = await _repo!.forgetPassword(
        email: email,
      );
      print(res);
    } catch (e) {
      result = e.toString();
    }

    _isLoading = false;
    notifyListeners();
    return result;
  }
 String logout()  {
    _isLoading = true;
    _loadingText = 'Please wait..';

    notifyListeners();
    String result = 'OK';

    try {
      final res =  _repo!.logout() ; 
     
    } catch (e) {
      result = e.toString();
    }

    _isLoading = false;
    notifyListeners();
    return result;
  }
}
