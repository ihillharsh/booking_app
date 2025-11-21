import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final double filterDistance;
  final String? filterPrice;
  final String? filterRating;
  final String? filterDiscount;

  const HomeState({
    this.filterDistance = 1.0,
    this.filterPrice,
    this.filterRating,
    this.filterDiscount,
  });

  int get selectedFiltersCount {
    return [
      filterPrice,
      filterRating,
      filterDiscount,
      filterDistance > 1.0 ? filterDistance : null,
    ].where((e) => e != null).length;
  }

  @override
  List<Object?> get props => [filterDistance, filterPrice, filterRating, filterDiscount];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super();
}

class HomeLoading extends HomeState {
  const HomeLoading({
    super.filterDistance,
    super.filterPrice,
    super.filterRating,
    super.filterDiscount,
  });
}

class HomeLoaded extends HomeState {
  final String greeting;

  const HomeLoaded(
    this.greeting, {
    super.filterDistance,
    super.filterPrice,
    super.filterRating,
    super.filterDiscount,
  });

  @override
  List<Object?> get props => [greeting, filterDistance, filterPrice, filterRating, filterDiscount];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(
    this.message, {
    super.filterDistance,
    super.filterPrice,
    super.filterRating,
    super.filterDiscount,
  });

  @override
  List<Object?> get props => [message, filterDistance, filterPrice, filterRating, filterDiscount];
}
