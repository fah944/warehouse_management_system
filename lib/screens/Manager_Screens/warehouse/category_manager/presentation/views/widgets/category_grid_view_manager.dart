import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/localization/app_localizations.dart';
import '../../../../../../warehouse_home/category_warehouse/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import '../../../../../../warehouse_home/category_warehouse/presentation/manager/get_all_category_cubit/get_all_category_state.dart';
import '../../../../item_manager/presentation/views/all_item_view_manager.dart';
import 'category_grid_view_item_manager.dart';

class CategoryGridViewManager extends StatelessWidget {
  const CategoryGridViewManager({Key? key, required this.typeId}) : super(key: key);

  final int typeId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllCategoryCubit, GetAllCategoryState>(
      listener: (context, state) {  },
      builder: (BuildContext context, state) {
        if (state is GetAllCategorySuccess) {
          return state.allCategories.isEmpty ? Center(child: Center(child: Text(AppLocalizations.of(context).translate('empty_list_message')),),)
              : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.allCategories.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:6,
              crossAxisSpacing: 18,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context,index)=> CategoryGridViewItemManager(
              allCategoryModel: state.allCategories[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_)=> AllItemViewManager(
                      typeId: typeId,
                      categoryId: state.allCategories[index].id,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is GetAllCategoryFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
