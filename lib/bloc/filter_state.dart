part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  const FilterLoaded(this.filterModel);
  final Filter filterModel;
}

class FilterError extends FilterState {
  const FilterError(this.message);
  final String? message;
}
