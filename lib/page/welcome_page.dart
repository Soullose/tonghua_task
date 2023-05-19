import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.blue,
        child: const Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '       仓库管理及控制系统是现代供应链管理的重要组成部分，能够实现各类仓储资源、设备的合理分配与高效利用。'
                  '利用条码技术、RFID技术对货物进行货位、批次、保质期、配送等实现电子标签管理，实现收货、发货、补货、集货、送货等各环节的规范化作业；'
                  '融合物联技术、地理信息技术构建库房沙盘，帮助管理者全面掌控仓储资源、设备和人员的状态，为科学调度提供精准信息；'
                  '借助手持终端实现任务驱动，提升仓储业务活动的全员参与度与协同能力；使用云计算、微服务等信息技术全方位集成数据、服务和流程，为企业提供更为完整的数据资产管理',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
