import 'package:equatable/equatable.dart';

import '../../../data/models/all_items_model.dart';
import '../../../data/models/expired_items_model.dart';
import '../../../data/models/expiring_soon_items_model.dart';

abstract class ExpiringSoonState  extends Equatable {
  const ExpiringSoonState();

  @override
  List<Object> get props => [];
}

class IncreasePaginateSuccess extends ExpiringSoonState {}

class ExpiringSoonItemsInitial extends ExpiringSoonState {}
class ExpiringSoonItemsLoading extends ExpiringSoonState {}
class ExpiringSoonItemsFailure extends ExpiringSoonState {
  final String errorMessage;

  const ExpiringSoonItemsFailure(this.errorMessage);
}
class ExpiringSoonItemsSuccess extends ExpiringSoonState {
  final ExpiringSoonItemsModel allItemsExpiring;

  const ExpiringSoonItemsSuccess(this.allItemsExpiring);
}

class ExpiredItemsInitial extends ExpiringSoonState {}
class ExpiredItemsLoading extends ExpiringSoonState {}
class ExpiredItemsFailure extends ExpiringSoonState {
  final String errorMessage;

  const ExpiredItemsFailure(this.errorMessage);
}
class ExpiredItemsSuccess extends ExpiringSoonState {
  final ExpiredItemsModel allItemsExpired;

  const ExpiredItemsSuccess(this.allItemsExpired);
}