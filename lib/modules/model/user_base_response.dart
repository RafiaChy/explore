import 'package:explore/modules/model/filter.dart';

class UserBaseResponse {
  UserBaseResponse({
    this.page,
    this.sortBy,
    this.filter,
  });

  UserBaseResponse.fromJson(dynamic json) {
    page = json['page'];
    sortBy = json['sort_by'];
    filter = json['filter'] != null ? Filter.fromJson(json['filter']) : null;
  }
  dynamic page;
  dynamic sortBy;
  dynamic filter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['sort_by'] = sortBy;
    if (filter != null) {
      map['filter'] = filter?.toJson();
    }
    return map;
  }
}
