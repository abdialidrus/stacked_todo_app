import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_todo_app/app/app.bottomsheets.dart';
import 'package:stacked_todo_app/app/app.dialogs.dart';
import 'package:stacked_todo_app/app/app.locator.dart';
import 'package:stacked_todo_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_todo_app/models/todo_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>(todoBoxName);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
