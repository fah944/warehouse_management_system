import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/app_manager.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../manager/consume_item_cubit/consume_item_cubit.dart';
import '../../manager/consume_item_cubit/consume_item_state.dart';
import '../../manager/delete_item_cubit/delete_item_cubit.dart';
import '../../manager/delete_item_cubit/delete_item_state.dart';
import '../../manager/expired_cubit/expired_cubit.dart';
import '../../manager/expired_cubit/expired_state.dart';
import '../../manager/expiring_soon_cubit/expiring_soon_cubit.dart';
import '../../manager/expiring_soon_cubit/expiring_soon_state.dart';
import '../../manager/get_all_items_cubit/get_all_items_cubit.dart';
import '../../manager/get_all_items_cubit/get_all_items_state.dart';
import '../item_details_view.dart';
import 'item_list_view_item.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key}) : super(key: key);

  final int paginate = 50;

  @override
  Widget build(BuildContext context) {
    GetAllItemsCubit cubit = GetAllItemsCubit.get(context);
    //return Text('data');
    return BlocConsumer<GetAllItemsCubit, GetAllItemsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<ExpiringSoonCubit, ExpiringSoonState>(
          listener: (contextExpiring, stateExpiring) {

          },
          builder: (contextExpiring, stateExpiring) {
            return BlocConsumer<ExpiredCubit, ExpiredState>(
              listener: (contextExpired, stateExpired) {

              },
              builder: (contextExpired, stateExpired) {
                return BlocConsumer<DeleteItemCubit, DeleteItemState>(
                  listener: (contextInner, stateInner) {
                    if (stateInner is DeleteItemSuccess) {
                      contextInner.read<GetAllItemsCubit>().fetchAllItems(
                          paginate: paginate
                      );
                      ScaffoldMessenger.of(contextInner).showSnackBar(
                        SnackBar(content: Text(AppLocalizations.of(context).translate('item_deleted_successfully'))),
                      );
                    } else if (stateInner is DeleteItemFailure) {
                      ScaffoldMessenger.of(contextInner).showSnackBar(
                        SnackBar(content: Text(AppLocalizations.of(context).translate('item_deleted_failed'))),
                      );
                    }
                  },
                  builder: (contextInner, stateInner) {
                    return BlocConsumer<ConsumeItemCubit, ConsumeItemState>(
                      listener: (contextConsume, stateConsume) {
                        if (stateConsume is ConsumeItemSuccess) {
                          contextConsume.read<GetAllItemsCubit>().fetchAllItems(
                              paginate: paginate
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(AppLocalizations.of(context).translate('item_decrease_successfully'))),
                          );
                        } else if (stateConsume is ConsumeItemFailure) {
                          contextConsume.read<GetAllItemsCubit>().fetchAllItems(
                              paginate: paginate
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(AppLocalizations.of(context).translate('item_decrease_failed'))),
                          );
                        }
                      },
                      builder: (contextConsume, stateConsume) {
                        if(state is GetAllItemsSuccess) {
                          return state.allItems.dataView!.isEmpty ? Center(child: Center(child: Text(AppLocalizations.of(context).translate('empty_list_message')),),)
                              : Column(
                            children: [
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.allItems.dataView!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ItemDetailsView(id: state.allItems.dataView![index].id),),
                                    );
                                  },
                                  child: ItemListViewItem(
                                    allItems: state.allItems.dataView![index],
                                    rank: 1 + index,
                                  ),
                                ),
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: AppSize.s24,
                                ),
                              ),
                              state.allItems.to !< state.allItems.total ? GestureDetector(
                                onTap: () {
                                  cubit.increasePaginate(paginate: cubit.afterIncreasePaginate);
                                  contextInner.read<GetAllItemsCubit>().fetchAllItems(
                                    paginate: cubit.afterIncreasePaginate,
                                  );
                                },
                                child: SizedBox(
                                  height: 50.0,
                                  width: MediaQuery.of(context).size.width * .05,
                                  child: Column(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).translate('see_more'),
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.grey.shade600,
                                        size: AppSize.s30,
                                      )
                                    ],
                                  ),
                                ),
                              ) : const SizedBox(height: 0.0, width: 0.0,),
                            ],
                          );
                        } else if(state is GetAllItemsFailure) {
                          return Text(state.errorMessage);
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    );
                  },
                );
              },
            );
          },
        );
      }
    );
  }
}

class ExpiringItemListView extends StatelessWidget {
  const ExpiringItemListView({Key? key}) : super(key: key);

  final int paginate = 50;

  @override
  Widget build(BuildContext context) {
    GetAllItemsCubit cubit = GetAllItemsCubit.get(context);
    //return Text('data');
    return BlocConsumer<ExpiringSoonCubit, ExpiringSoonState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<DeleteItemCubit, DeleteItemState>(
            listener: (contextInner, stateInner) {
              if (stateInner is DeleteItemSuccess) {
                contextInner.read<GetAllItemsCubit>().fetchAllItems(
                    paginate: paginate
                );
                ScaffoldMessenger.of(contextInner).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context).translate('item_deleted_successfully'))),
                );
              } else if (stateInner is DeleteItemFailure) {
                ScaffoldMessenger.of(contextInner).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context).translate('item_deleted_failed'))),
                );
              }
            },
            builder: (contextInner, stateInner) {
              return BlocConsumer<ConsumeItemCubit, ConsumeItemState>(
                listener: (contextConsume, stateConsume) {
                  if (stateConsume is ConsumeItemSuccess) {
                    contextConsume.read<GetAllItemsCubit>().fetchAllItems(
                        paginate: paginate
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppLocalizations.of(context).translate('item_decrease_successfully'))),
                    );
                  } else if (stateConsume is ConsumeItemFailure) {
                    contextConsume.read<GetAllItemsCubit>().fetchAllItems(
                        paginate: paginate
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppLocalizations.of(context).translate('item_decrease_failed'))),
                    );
                  }
                },
                builder: (contextConsume, stateConsume) {
                  if(state is ExpiringSoonItemsSuccess) {
                    return state.allItemsExpiring.dataExpiring!.isEmpty ? Center(child: Center(child: Text(AppLocalizations.of(context).translate('empty_list_message')),),)
                        : Column(
                      children: [
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.allItemsExpiring.dataExpiring!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ItemDetailsView(id: state.allItemsExpiring.dataExpiring![index].id),),
                              );
                            },
                            child: ExpiringItemListViewItem(
                              allItems: state.allItemsExpiring.dataExpiring![index],
                              rank: 1 + index,
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: AppSize.s24,
                          ),
                        ),
                        state.allItemsExpiring.to !< state.allItemsExpiring.total ? GestureDetector(
                          onTap: () {
                            cubit.increasePaginate(paginate: cubit.afterIncreasePaginate);
                            contextInner.read<GetAllItemsCubit>().fetchAllItems(
                              paginate: cubit.afterIncreasePaginate,
                            );
                          },
                          child: SizedBox(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width * .05,
                            child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate('see_more'),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.grey.shade600,
                                  size: AppSize.s30,
                                )
                              ],
                            ),
                          ),
                        ) : const SizedBox(height: 0.0, width: 0.0,),
                      ],
                    );
                  } else if(state is ExpiringSoonItemsFailure) {
                    return Text(state.errorMessage);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            },
          );
        }
    );
  }
}

class ExpiredItemListView extends StatelessWidget {
  const ExpiredItemListView({Key? key}) : super(key: key);

  final int paginate = 50;

  @override
  Widget build(BuildContext context) {
    GetAllItemsCubit cubit = GetAllItemsCubit.get(context);
    //return Text('data');
    return BlocConsumer<ExpiredCubit, ExpiredState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<DeleteItemCubit, DeleteItemState>(
            listener: (contextInner, stateInner) {
              if (stateInner is DeleteItemSuccess) {
                contextInner.read<GetAllItemsCubit>().fetchAllItems(
                    paginate: paginate
                );
                ScaffoldMessenger.of(contextInner).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context).translate('item_deleted_successfully'))),
                );
              } else if (stateInner is DeleteItemFailure) {
                ScaffoldMessenger.of(contextInner).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context).translate('item_deleted_failed'))),
                );
              }
            },
            builder: (contextInner, stateInner) {
              return BlocConsumer<ConsumeItemCubit, ConsumeItemState>(
                listener: (contextConsume, stateConsume) {
                  if (stateConsume is ConsumeItemSuccess) {
                    contextConsume.read<GetAllItemsCubit>().fetchAllItems(
                        paginate: paginate
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppLocalizations.of(context).translate('item_decrease_successfully'))),
                    );
                  } else if (stateConsume is ConsumeItemFailure) {
                    contextConsume.read<GetAllItemsCubit>().fetchAllItems(
                        paginate: paginate
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppLocalizations.of(context).translate('item_decrease_failed'))),
                    );
                  }
                },
                builder: (contextConsume, stateConsume) {
                  if(state is ExpiredItemsSuccess) {
                    return state.allItemsExpired.dataExpired!.isEmpty ? Center(child: Center(child: Text(AppLocalizations.of(context).translate('empty_list_message')),),)
                        : Column(
                      children: [
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.allItemsExpired.dataExpired!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ItemDetailsView(id: state.allItemsExpired.dataExpired![index].id),),
                              );
                            },
                            child: ExpiredItemListViewItem(
                              allItems: state.allItemsExpired.dataExpired![index],
                              rank: 1 + index,
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: AppSize.s24,
                          ),
                        ),
                        state.allItemsExpired.to !< state.allItemsExpired.total ? GestureDetector(
                          onTap: () {
                            cubit.increasePaginate(paginate: cubit.afterIncreasePaginate);
                            contextInner.read<GetAllItemsCubit>().fetchAllItems(
                              paginate: cubit.afterIncreasePaginate,
                            );
                          },
                          child: SizedBox(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width * .05,
                            child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate('see_more'),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.grey.shade600,
                                  size: AppSize.s30,
                                )
                              ],
                            ),
                          ),
                        ) : const SizedBox(height: 0.0, width: 0.0,),
                      ],
                    );
                  } else if(state is ExpiredItemsFailure) {
                    return Text(state.errorMessage);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            },
          );
        }
    );
  }
}