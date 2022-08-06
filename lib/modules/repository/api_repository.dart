import 'package:dartz/dartz.dart';
import 'package:explore/config/failure.dart';
import 'package:explore/modules/model/filter.dart';

import 'package:explore/modules/provider/api_provider.dart';
import 'package:explore/utils/enums/fetch_error.dart';

class ApiRepository {
  ApiRepository(this._apiProvider);

  final ApiProvider _apiProvider;



// use Future Either
  Future<Either<Failure, Filter>> api(Filter request, String token) async {
    try {
      final response = await _apiProvider.fetchPost(request, token);
      return Right(Filter.fromJson(response));
    } on Failure catch (e) {
      return Left(e);
    } on Exception {
      return Left(
        Failure(
          fetchError: FetchError.unknownError,
        ),
      );
    }
  }
}
