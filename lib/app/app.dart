import 'package:stacked_todo_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked_todo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_todo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_todo_app/ui/views/todo/todo_view.dart';
import 'package:stacked_todo_app/services/todo_service.dart';
import 'package:stacked_todo_app/services/hive_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TodoView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TodoService),
    LazySingleton(classType: HiveService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}