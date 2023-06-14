class ApiPath {
  const ApiPath._();

  static const String sysUrl = "/api";
  static const String wcsUrl = "/wcs";

  //登录url
  static const String signInUrl = '$sysUrl/login';

  //登出url
  static const String signOutUrl = '$sysUrl/logout';

  //初始化用户数据
  static const String initUrl = '$sysUrl/framework/init_data';

  ///信息录入rest地址 /PDA/matInfoCreate
  static const String pdaMatInfoCreate = '/PDA/matInfoCreate';

  ///出入库确认更改物资状态 /PDA/matInfoStatusUpdate
  static const String pdaMatInfoStateUpdate = '/PDA/matInfoStatusUpdate';

  ///更新任务状态 /PDA/updateSchemeStatus
  static const String pdaUpdateSchemeStatus = '/PDA/updateSchemeItemsStates';

  ///扫描二维码根据matcode查询物资详细信息
  static const String pdaGetMatInfoMessage = '/PDA/getMatInfoMessage';

  ///单车任务
  static const String pdaCrane = '/schedule/todos';
}
