import 'package:explore/modules/model/filter.dart';
import 'package:explore/modules/provider/filter_provider.dart';

class FilterRepository {
  final _provider = FilterProvider();

  Future<Filter> fetchList() {
    return _provider.fetchList();
  }
}

class NetworkError extends Error {}
