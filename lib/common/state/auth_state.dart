import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.signedIn({String? username, String? password}) =
      SignedIn;

  const factory AuthState.signedOut() = SignedOut;
}
