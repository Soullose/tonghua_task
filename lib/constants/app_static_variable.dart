class AppStaticV {
  const AppStaticV._();

  ///信息录入 PlatformUserInboundInput PlatformUserInboundConfirmed
  static const String inboundInput = 'PlatformUserInboundConfirmed';

  ///入库 WarehouseUserConfirmInbound WarehouseUserInboundConfirmed
  static const String confirmInbound = 'WarehouseUserInboundConfirmed';

  ///出库 PlatformUserConfirmOutbound PlatformUserOutboundConfirmed
  static const String outBoundConfirm = 'PlatformUserOutboundConfirmed';

  ///设备编号 上洞口站台行车
  static const String platformCrane01 = 'PLATFORM_CRANE01';

  ///设备编号 上洞口库内行车
  static const String warehouseCrane01 = 'WAREHOUSE_CRANE01';

  ///设备编号 下洞口站台行车
  static const String platformCrane02 = 'PLATFORM_CRANE02';

  ///设备编号 下洞口库内行车
  static const String warehouseCrane02 = 'WAREHOUSE_CRANE02';

  ///设备编号 平板AGV
  static const String plantAGV = 'AGV01';

  //////设备编号 移载AGV
  static const String transplantAGV = 'AGV02';

  ///agv到站台临时任务
  static const String pdaAgv2truckParams = 'agv2truck';

  ///站台到卡车临时任务
  static const String pdaTruck2agvParams = 'truck2agv';
}

///设备名称 上洞口站台行车
const String platformCraneUpZH = '上洞口站台行车';

///设备名称 上洞口库内行车
const String warehouseCraneUpZH = '上洞口库内行车';

///设备名称 下洞口站台行车
const String platformCraneDownZH = '下洞口站台行车';

///设备名称 下洞口库内行车
const String warehouseCraneDownZH = '下洞口库内行车';

///设备名称 平板AGV
const String plantAGVZH = '平板AGV';

///设备名称 移载AGV
const String transplantAGVZH = '移载AGV';
