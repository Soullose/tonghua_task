abstract class IAuthFacade {
  Future signInWithUsernameAndPassword(
      {required String username, required String password});

  Future signOut();
}
