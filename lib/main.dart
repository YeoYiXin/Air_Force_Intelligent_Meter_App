import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/firebase_options.dart';
import 'package:intelligent_meter_app/src/pages/homepage/homepage.dart';

Future<void> main() async {
  // // Set up the SettingsController, which will glue user settings to multiple
  // // Flutter Widgets.
  // final settingsController = SettingsController(SettingsService());

  // // Load the user's preferred theme while the splash screen is displayed.
  // // This prevents a sudden theme change when the app is first displayed.
  // await settingsController.loadSettings();

  // // Run the app and pass in the SettingsController. The app listens to the
  // // SettingsController for changes, then passes it further down to the
  // // SettingsView.
  // // runApp(MyApp(settingsController: settingsController));
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final SettingsController settingsController;

  // const MyApp({Key key, this.settingsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Air Selangor Intelligent Meter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // brightness: settingsController.brightness,
        ),
        home: Homepage(),
        // routes: {
        //   // '/': (context) => const Home(),
        //   // '/settings': (context) => SettingsView(controller: settingsController),
        // });
    );
  }
}
