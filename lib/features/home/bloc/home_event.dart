import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}

class UpdateFilterDistance extends HomeEvent {
  final double distance;

  const UpdateFilterDistance(this.distance);

  @override
  List<Object?> get props => [distance];
}

class UpdateFilterPrice extends HomeEvent {
  final String? price;

  const UpdateFilterPrice(this.price);

  @override
  List<Object?> get props => [price];
}

class UpdateFilterRating extends HomeEvent {
  final String? rating;

  const UpdateFilterRating(this.rating);

  @override
  List<Object?> get props => [rating];
}

class UpdateFilterDiscount extends HomeEvent {
  final String? discount;

  const UpdateFilterDiscount(this.discount);

  @override
  List<Object?> get props => [discount];
}

class ClearFilters extends HomeEvent {
  const ClearFilters();
}

class ApplyFilters extends HomeEvent {
  const ApplyFilters();
}
