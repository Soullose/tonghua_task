enum TaskType {
  straightInbound(code: 'StraightInbound', description: '直线段入库'),
  straightOutbound(code: 'StraightOutbound', description: '直线段出库'),
  curveInbound(code: 'CurveInbound', description: '弯道段入库'),
  curveOutbound(code: 'CurveOutbound', description: '弯道段出库'),
  agv2Truck(code: 'Agv2Truck', description: 'AGV到卡车吊装作业'),
  truck2Agv(code: 'Truck2Agv', description: '卡车到AGV吊装作业'),
  agv2Stack(code: 'Agv2Stack', description: 'AGV到堆垛吊装作业'),
  stack2Agv(code: 'Stack2Agv', description: '堆垛到AGV吊装作业'),
  stack2Stack(code: 'Stack2Stack', description: '单行车移库作业');

  final String code;
  final String description;

  const TaskType({required this.code, required this.description});
}

extension on TaskType {
  get description => this.description;
}
