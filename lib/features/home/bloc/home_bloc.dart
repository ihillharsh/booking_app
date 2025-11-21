import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<UpdateFilterDistance>(_onUpdateFilterDistance);
    on<UpdateFilterPrice>(_onUpdateFilterPrice);
    on<UpdateFilterRating>(_onUpdateFilterRating);
    on<UpdateFilterDiscount>(_onUpdateFilterDiscount);
    on<ClearFilters>(_onClearFilters);
    on<ApplyFilters>(_onApplyFilters);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading(
      filterDistance: state.filterDistance,
      filterPrice: state.filterPrice,
      filterRating: state.filterRating,
      filterDiscount: state.filterDiscount,
    ));

    await Future.delayed(const Duration(milliseconds: 500));

    final hour = DateTime.now().hour;
    String greeting;

    if (hour < 12) {
      greeting = 'Good Morning!';
    } else if (hour < 17) {
      greeting = 'Good Afternoon!';
    } else {
      greeting = 'Good Evening!';
    }

    emit(HomeLoaded(
      greeting,
      filterDistance: state.filterDistance,
      filterPrice: state.filterPrice,
      filterRating: state.filterRating,
      filterDiscount: state.filterDiscount,
    ));
  }

  void _onUpdateFilterDistance(
    UpdateFilterDistance event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeLoaded) {
      emit(HomeLoaded(
        (state as HomeLoaded).greeting,
        filterDistance: event.distance,
        filterPrice: state.filterPrice,
        filterRating: state.filterRating,
        filterDiscount: state.filterDiscount,
      ));
    }
  }

  void _onUpdateFilterPrice(
    UpdateFilterPrice event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeLoaded) {
      emit(HomeLoaded(
        (state as HomeLoaded).greeting,
        filterDistance: state.filterDistance,
        filterPrice: event.price,
        filterRating: state.filterRating,
        filterDiscount: state.filterDiscount,
      ));
    }
  }

  void _onUpdateFilterRating(
    UpdateFilterRating event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeLoaded) {
      emit(HomeLoaded(
        (state as HomeLoaded).greeting,
        filterDistance: state.filterDistance,
        filterPrice: state.filterPrice,
        filterRating: event.rating,
        filterDiscount: state.filterDiscount,
      ));
    }
  }

  void _onUpdateFilterDiscount(
    UpdateFilterDiscount event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeLoaded) {
      emit(HomeLoaded(
        (state as HomeLoaded).greeting,
        filterDistance: state.filterDistance,
        filterPrice: state.filterPrice,
        filterRating: state.filterRating,
        filterDiscount: event.discount,
      ));
    }
  }

  void _onClearFilters(
    ClearFilters event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeLoaded) {
      emit(HomeLoaded(
        (state as HomeLoaded).greeting,
        filterDistance: 1.0,
        filterPrice: null,
        filterRating: null,
        filterDiscount: null,
      ));
    }
  }

  void _onApplyFilters(
    ApplyFilters event,
    Emitter<HomeState> emit,
  ) {
    // Filters are already in state, just emit current state
    // This event can be used to trigger any side effects if needed
  }
}
