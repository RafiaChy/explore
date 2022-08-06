import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explore/modules/model/filter.dart';
import 'package:explore/modules/repository/filter_repository.dart';


part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    final _filterRepository = FilterRepository();

    on<GetList>((event, emit) async {
      try {
        emit(FilterLoading());
        final mList = await _filterRepository.fetchList();
        emit(FilterLoaded(mList));
       
      } on NetworkError {
        emit(const FilterError('Failed to fetch data. is your device online?'));
      }
    });
  }
}
