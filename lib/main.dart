import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/res/routes/routes.dart';
import 'package:ecommerce_app/views/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final AppRouter appRouter = AppRouter();
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppPalette.backgroundColor),
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      // routerConfig: appRouter.router,
      // routeInformationParser: AppRouter().router.routeInformationParser,
      // routerDelegate: AppRouter().router.routerDelegate,
      home: const FirstScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
