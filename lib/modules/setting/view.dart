import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/modules/setting/state.dart';

import '../../common/storage/basic_storage_provider.dart';
import 'widget/theme_mode_list_tile.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ipAddressController = TextEditingController();

    final settingState = ref.watch(settingStateProvider.notifier);

    final ip = ref.watch(ipAddressProvider);

    String ipAddress = ip;

    ipAddressController.text = ipAddress;

    return Scaffold(
      appBar: AppBar(
        title: Text(settingState.title),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.lock),
            title: Row(
              children: [
                const Text('服务地址'),
                const Spacer(),
                Consumer(builder: (context, ref, child) => Text(ip)),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('修改ip地址'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: ipAddressController,
                          decoration:
                              const InputDecoration(labelText: '输入ip地址...'),
                          onChanged: (value) => ipAddress = value,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('取消')),
                      TextButton(
                          onPressed: () {
                            ref.read(ipAddressProvider.notifier).state =
                                ipAddressController.text;
                            if (kDebugMode) {
                              print('服务地址:${serveAddress.name}');
                            }
                            if (kDebugMode) {
                              print('服务地址:${ref.watch(serveAddress)}');
                            }
                            Navigator.of(context).pop();
                          },
                          child: const Text('确定')),
                    ],
                  );
                },
              );
            },
          ),

          const ThemeModeListTile(),
        ],
      ),
    );
  }
}
