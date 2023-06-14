enum RouterPath {
  signIn(name: '登录', path: '/sign_page'),
  welcome(name: '欢迎页', path: '/welcome_page'),
  setting(name: '设置页', path: '/setting'),
  // home(name: '主页', path: '/'),
  taskMonitor(name: '任务监控', path: '/task_monitor'),
  singleTask(name: '单车任务', path: '/single_task');

  const RouterPath({required this.name, required this.path});

  final String name;
  final String path;
}
