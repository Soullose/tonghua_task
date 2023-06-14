import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/common/router/router_path.dart';

import '../../common/state/auth.dart';

class SigneInPage extends ConsumerWidget {
  const SigneInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController usernameTextEditingController =
        TextEditingController(text: 'admin');
    TextEditingController passwordTextEditingController =
        TextEditingController(text: 'admin');

    return Scaffold(
      appBar: null,
      body: Container(
        margin: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 46),
                child: Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 38,
                      child: SvgPicture.asset('assets/images/user.svg')),
                ),
              ),
              TextField(
                controller: usernameTextEditingController,
                // keyboardType: ,
                decoration: const InputDecoration(
                  hintText: '请输入账号',
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 14, end: 22, bottom: 18),
                    child: Text(
                      '账号',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: passwordTextEditingController,
                decoration: const InputDecoration(
                  hintText: '请输入密码',
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 14, end: 22, bottom: 18),
                    child: Text(
                      '密码',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 58.0),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    if (kDebugMode) {
                      print('用户名:${usernameTextEditingController.text}');
                    }
                    if (kDebugMode) {
                      print('密码:${passwordTextEditingController.text}');
                    }
                    ref.watch(authNotifierProvider.notifier).login(
                          usernameTextEditingController.text,
                          passwordTextEditingController.text,
                        );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.blue),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                  // fillColor: Colors.blue,
                  // elevation: 0.0,
                  // padding: const EdgeInsets.symmetric(vertical: 16.0),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(6.0),
                  // ),
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white, fontSize: 22.sp),
                  ),
                ),
              ),


              // const Divider(
              //   height: 1,
              // ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  '设置',
                  style: TextStyle(
                      color: Colors.black, fontSize: 18.sp),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.push(RouterPath.setting.path);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
