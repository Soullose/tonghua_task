import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/application/authentication/i_auth_facade.dart';
import 'package:tonghua_task/model/user.dart';

class AuthController extends StateNotifier<User> {
  AuthController(this._authFacade) : super(User.initial());

  final IAuthFacade _authFacade;

  Future signInWithUsernameAndPassword(String username, String password) {
    return _authFacade.signInWithUsernameAndPassword(
        username: username, password: password);
  }

  Future signOut() {
    return _authFacade.signOut();
  }
}
