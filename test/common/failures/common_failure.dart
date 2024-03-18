import 'package:freezed_annotation/freezed_annotation.dart';
part 'common_failure.freezed.dart';

@freezed
class CommonFailure with _$CommonFailure {
  const CommonFailure._();
  const factory CommonFailure.data({required String message}) = _Data;
}
