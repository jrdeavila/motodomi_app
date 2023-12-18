import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:motodomi_app/lib.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() {
  return Future.wait([
    getIt.init(),
    GetStorage.init(),
    initializeDateFormatting('es_CO', null),
  ]);
}
