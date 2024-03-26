import 'package:e_mart/data/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:e_mart/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  // Add widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage
  await GetStorage.init();
  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize Supabase
  await Supabase.initialize(
    url: 'https://etzyyrybocabvbtrkpgf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV0enl5cnlib2NhYnZidHJrcGdmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTEwMTA4ODYsImV4cCI6MjAyNjU4Njg4Nn0.nlaJoE86JR17070lUMnh9eAphFUsppW1cvsTiDLmiiI',
  ).then((value) => Get.put(AuthenticationRepository()));
  // .then((value) => AuthenticationRepository.instance.logout());
  // Todo: Initialize Authentication

  runApp(const App());
}

// Get a reference for your Supabase client
final supabase = Supabase.instance.client;
