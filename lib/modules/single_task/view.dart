import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/authentication/auth_controller.dart';

class SingleTaskPage extends ConsumerWidget {
  const SingleTaskPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInProvider = ref.watch(signeInProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '单车任务',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    signInProvider.signOut();
                  },
                  child: const Text('退出')),
            )
          ],
        ),
      ),
    );
  }
}
