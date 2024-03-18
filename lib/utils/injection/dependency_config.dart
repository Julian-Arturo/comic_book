import 'package:comic_book/common/network/client_http.dart';
import 'package:comic_book/utils/injection/dependency_config.config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// coverage:ignore-file
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
@lazySingleton
FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

void configureDependencies() {
  init(getIt);
  getIt.registerSingleton<ClientHttp>(ClientHttp());
}
