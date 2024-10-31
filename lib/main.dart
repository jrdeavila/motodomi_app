import 'package:flutter/services.dart';
import 'package:motodomi_app/lib.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Initialize Injection
    await configureDependencies();
    // Close the keyboard if is open
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    // Run the app
    runApp(const App());
  }, (error, stack) {
    final controller = Get.put(ExceptionCtrl(), permanent: true);
    controller.onDebugException(error, stack);
    controller.exception(error);
  });
}
