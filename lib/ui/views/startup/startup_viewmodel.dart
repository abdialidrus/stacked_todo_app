import 'package:stacked/stacked.dart';
import 'package:stacked_todo_app/app/app.locator.dart';
import 'package:stacked_todo_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    _navigationService.replaceWithTodoView();
  }
}
