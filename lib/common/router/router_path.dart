enum RouterPath {
  home(name: '主页', path: '/'),
  signIn(name: '登录', path: '/sign_page'),
  welcome(name: '欢迎页', path: '/welcome_page');

  const RouterPath({required this.name, required this.path});

  final String name;
  final String path;
}
