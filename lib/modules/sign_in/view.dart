import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/authentication/auth_controller.dart';
import '../../common/router/router_path.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final MediaQueryData media = MediaQuery.of(context);
    final bool useTwoColumns = media.size.height < 500;
    final double spaceFactor = useTwoColumns ? 0.5 : 1;

    TextEditingController usernameTextEditingController =
        TextEditingController(text: 'admin');
    TextEditingController passwordTextEditingController =
        TextEditingController(text: 'admin');
    final signInProvider = ref.watch(signeInProvider.notifier);
    return Scaffold(
      appBar: null,
      body: Container(
        margin: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Padding(
              //   padding: const EdgeInsets.only(top: 40, bottom: 46),
              //   child: Center(
              //     child: CircleAvatar(
              //         backgroundColor: Colors.transparent,
              //         radius: 38,
              //         child: SvgPicture.asset(
              //           'assets/images/user.svg',
              //           color: Colors.black,
              //         )),
              //   ),
              // ),
              const SizedBox(height: 64),
              Text(
                '登录',
                style: textTheme.headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16 * spaceFactor),
              TextField(
                controller: usernameTextEditingController,
                // keyboardType: ,
                decoration: const InputDecoration(
                    hintText: '请输入账号',
                    labelText: '账号',
                    prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(height: 16 * spaceFactor),
              TextField(
                controller: passwordTextEditingController,
                decoration: const InputDecoration(
                  hintText: '请输入密码',
                  labelText: '密码',
                  prefixIcon: Icon(Icons.key),
                ),
              ),
              const SizedBox(height: 58.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (kDebugMode) {
                      print('用户名:${usernameTextEditingController.text}');
                    }
                    if (kDebugMode) {
                      print('密码:${passwordTextEditingController.text}');
                    }
                    signInProvider
                        .signInWithUsernameAndPassword(
                          usernameTextEditingController.text,
                          passwordTextEditingController.text,
                        )
                        .then((value) => signInProvider
                            .initData(
                              usernameTextEditingController.text,
                              passwordTextEditingController.text,
                            )
                            .then((value) => signInProvider.clientMqtt()));
                  },
                  // style: ButtonStyle(
                  //   backgroundColor:
                  //       const MaterialStatePropertyAll(Colors.blue),
                  //   shape: MaterialStatePropertyAll(
                  //     RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //     ),
                  //   ),
                  // ),
                  // fillColor: Colors.blue,
                  // elevation: 0.0,
                  // padding: const EdgeInsets.symmetric(vertical: 16.0),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(6.0),
                  // ),
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: 22.sp),
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
                  style: TextStyle(fontSize: 18.sp),
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
