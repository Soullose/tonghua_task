abstract class IAuthFacade {
  Future signInWithUsernameAndPassword(
      {required String username, required String password});

  Future initData();

  Future signOut();
}
