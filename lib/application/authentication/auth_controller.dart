import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/application/authentication/i_auth_facade.dart';
import 'package:tonghua_task/model/user.dart';

import 'auth_facade.dart';

class AuthController extends StateNotifier<void> {
  AuthController(this._authFacade) : super(null);

  final IAuthFacade _authFacade;

  Future signInWithUsernameAndPassword(String username, String password) {
    return _authFacade.signInWithUsernameAndPassword(
        username: username, password: password);
  }

  Future signOut() {
    return _authFacade.signOut();
  }
}

final signeInProvider = StateNotifierProvider.autoDispose((ref) {
  final authFacade = AuthFacade(ref: ref);
  return AuthController(authFacade);
});
