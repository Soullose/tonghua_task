import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/net/http_client.dart';
import 'auth_facade.dart';
import 'i_auth_facade.dart';

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

  Future initData(String username, String password) {
    return _authFacade.initData(username: username, password: password);
  }

  Future clientMqtt() {
    return _authFacade.clientMqtt();
  }
}

final signeInProvider = StateNotifierProvider.autoDispose((ref) {
  final httpManager = ref.read(httpManagerProvider.notifier);
  final authFacade = AuthFacade(ref: ref, httpManager: httpManager);
  return AuthController(authFacade);
});
