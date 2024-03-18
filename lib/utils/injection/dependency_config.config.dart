// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../common/network/client_http.dart' as _i4;
import '../../data/data_source/comic_data_source.dart' as _i3;
import '../../data/repositories/auth_repository_impl.dart' as _i10;
import '../../data/repositories/comic_repository_impl.dart' as _i6;
import '../../domain/repositories/auth_repository.dart' as _i9;
import '../../domain/repositories/comic_repository.dart' as _i5;
import '../../domain/usecases/auth_use_case.dart' as _i11;
import '../../domain/usecases/comic_use_case.dart' as _i8;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.ComicDataSource>(
      () => _i3.ComicDataSourceImpl(gh<_i4.ClientHttp>()));
  gh.factory<_i5.ComicRepository>(
      () => _i6.ComicRepositoryImpl(gh<_i3.ComicDataSource>()));
  gh.lazySingleton<_i7.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.factory<_i8.GetComicsUseCase>(
      () => _i8.GetComicsUseCase(gh<_i5.ComicRepository>()));
  gh.factory<_i9.AuthRepository>(
      () => _i10.FirebaseAuthRepository(gh<_i7.FirebaseAuth>()));
  gh.factory<_i11.AuthUseCase>(
      () => _i11.AuthUseCase(gh<_i9.AuthRepository>()));
  return getIt;
}

class _$RegisterModule extends _i10.RegisterModule {}
