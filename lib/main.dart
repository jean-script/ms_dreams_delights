import 'dart:developer';

import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ms_dreams_delights/app/binder/initial_binder.dart';
import 'package:ms_dreams_delights/app/routes/routes.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_options.dart';
import 'package:ms_dreams_delights/app/theme/theme.dart';
import 'package:ms_dreams_delights/app/utils/dir_path.dart';

void main() async {
  Intl.defaultLocale = 'pt_BR';
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  dirImage = await createdDir();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    print('LicenseEntryWithLineBreaks $license');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  PlatformDispatcher.instance.onError = (error, stack) {
    log('PlatformDispatcher.instance.onError');
    log(error.toString(), stackTrace: stack);
    return true;
  };

  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "dreams&delights",
      debugShowCheckedModeBanner: false,
      theme: MyTheme.get(context),
      getPages: MyRoutes.get(),
      // builder: (context, child) => child!,
      builder: DevicePreview.appBuilder,
      locale: const Locale('pt', 'BR'),
      initialBinding: InitialBinder(),
    );
  }
}
