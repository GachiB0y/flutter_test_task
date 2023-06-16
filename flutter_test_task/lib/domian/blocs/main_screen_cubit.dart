import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/domian/api_client/deal_client.dart';
import 'package:flutter_test_task/domian/entity/deal.dart';

class MainScreenState {
  List<Deal> _listDeal = [];
  List<Deal> get itemsGet => _listDeal;
  set itemSet(Deal val) => _listDeal.add(val);

  MainScreenState({required List<Deal> listDeal}) : _listDeal = listDeal;

  MainScreenState copyWith({
    List<Deal>? listDeal,
  }) {
    return MainScreenState(
      listDeal: listDeal ?? this._listDeal,
    );
  }

  @override
  bool operator ==(covariant MainScreenState other) {
    if (identical(this, other)) return true;

    return listEquals(other._listDeal, _listDeal);
  }

  @override
  int get hashCode => _listDeal.hashCode;
}

class MainScreenCubit extends Cubit<MainScreenState> {
  final apiClient = DealApiClient();
  MainScreenCubit() : super(MainScreenState(listDeal: [])) {
    loadDeal();
  }

  void loadDeal() async {
    final res = await apiClient.fetchDeal();
    if (res.isEmpty) return;
    final newState = state.copyWith(listDeal: res);
    emit(newState);
  }
}
