import 'package:e_mart/bindings/general_bindings.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/theme/theme.dart';

// Use this class to setup themes, initial Bindings, any animations and much more
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        home: const Scaffold(
            backgroundColor: TColors.primary,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )));
  }
}
