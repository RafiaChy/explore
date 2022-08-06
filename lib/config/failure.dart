import 'package:explore/utils/enums/fetch_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure implements Exception {
  factory Failure({
    required FetchError fetchError,
  }) = _Failure;
}
