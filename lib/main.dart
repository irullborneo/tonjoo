import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tonjoo/config/routes/tj_pages.dart';
import 'package:tonjoo/config/themes/tj_theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await dotenv.load(fileName: '.env');
  await GetStorage.init();
  await inisializeDependecies();

  runApp(
    ScreenUtilInit(
      designSize: const Size(411, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget){
        return GetMaterialApp(
          theme: TjTheme.light,
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: TjPages.initial,
          builder: EasyLoading.init(),
          getPages: TjPages.getRoutes(),
        );
      },
    ),
  );

  configLoading();
}
