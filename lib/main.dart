import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blood_pressure/build_constant.dart';
import 'package:flutter_blood_pressure/core/theme/color_schemes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

void delegate() {
  switch (Environment.environment) {
    case Flavor.development:
      Logger().d('run this line');
      runDevelopment();
      break;
    case Flavor.production:
      Logger().d('run this line: production');

      runApp(const MyApp());
      break;
  }
}

runDevelopment() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: (context, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: Environment.isDev ? DevicePreview.locale(context) : null,
          builder: Environment.isDev ? DevicePreview.appBuilder : null,
          theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
          darkTheme:
              ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          home: Scaffold(
            appBar: AppBar(title: const Text('test example')),
          ),
        );
      },
    );
  }
}
