

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/init_data/init_data.dart';

part 'user_state.g.dart';
// @Riverpod(keepAlive: true)
@riverpod
class UserState extends _$UserState{

  @override
  FutureOr<User?> build(){
    return null;
  }

  set index(User v) => state = AsyncValue.data(v);

  void setInitUser(User v) => index = v;
}