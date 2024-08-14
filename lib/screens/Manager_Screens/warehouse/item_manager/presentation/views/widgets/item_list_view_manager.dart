import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/localization/app_localizations.dart';
import '../../../../../../../core/utils/app_manager.dart';
import '../../../../../../warehouse_home/item_warehouse/presentation/manager/get_all_items_cubit/get_all_items_cubit.dart';
import '../../../../../../warehouse_home/item_warehouse/presentation/manager/get_all_items_cubit/get_all_items_state.dart';
import '../../../../../../warehouse_home/item_warehouse/presentation/views/item_details_view.dart';
import 'item_list_view_item_manager.dart';

class ItemListViewManager extends StatelessWidget {
  const ItemListViewManager({Key? key}) : super(key: key);

  final int paginate = 50;

  @override
  Widget build(BuildContext context) {
    GetAllItemsCubit cubit = GetAllItemsCubit.get(context);
    return BlocBuilder<GetAllItemsCubit, GetAllItemsState>(
        builder: (context, state) {
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
                    child: ItemListViewItemManager(
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
                    context.read<GetAllItemsCubit>().fetchAllItems(
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
        }
    );
  }
}
