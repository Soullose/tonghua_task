import "package:freezed_annotation/freezed_annotation.dart";

part "auth_events.freezed.dart";

@freezed
class AuthEvents with _$AuthEvents {
  const factory AuthEvents.usernameChanged({required String? username}) =
  usernameChanged;

  const factory AuthEvents.passwordChanged({required String? password}) =
  PasswordChanged;

  const factory AuthEvents.signInWithUsernameAndPasswordPressed() =
  SignInWithUsernameAndPasswordPressed;
}
