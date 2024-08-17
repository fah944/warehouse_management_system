import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/style_manager.dart';
import '../../../../../../widgets/icon_btn_widget.dart';
import '../../../data/models/get_all_category_model.dart';
import '../../manager/delete_category_cubit/delete_category_cubit.dart';

class ChildCategoryGridViewItem extends StatelessWidget {
  ChildCategoryGridViewItem({Key? key, required this.allCategoryModel, this.onTap}) : super(key: key);

  final GetAllCategoryModel allCategoryModel;
  final Function()? onTap;
  final TextEditingController typeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints.tightFor(
              width: MediaQuery.of(context).size.width/6,
              height: 165.0,
            ),
            padding:const EdgeInsetsDirectional.symmetric(
              vertical: AppPadding.p16,
              horizontal: AppPadding.p16,
            ),
            decoration: BoxDecoration(
              color: ColorManager.bc2,
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    /*IconBtnWidget(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogFieldWidget(
                              title: AppLocalizations.of(context).translate('add_new_category'),
                              hintText: AppLocalizations.of(context).translate('enter_name'),
                              controller: categoryController,
                              onPressed: () {
                                final createCategoryCubit =
                                context.read<CreateCategoryCubit>();
                                createCategoryCubit.fetchCreateCategory(
                                    name: categoryController.text, parentId: allCategoryModel.id);
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                      icon: Icons.add,
                      color: ColorManager.blue2,
                    ),*/
                    IconBtnWidget(
                      onPressed: ()
                      {
                        DeleteCategoryCubit.get(context).fetchDeleteCategory(id: allCategoryModel.id);
                      },
                      icon: Icons.delete,
                      color: ColorManager.orange,
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s20,),
                //name
                Center(
                  child: Text(
                    allCategoryModel.name,
                    style: StyleManager.body1SemiBold(color: ColorManager.blackColor),
                  ),
                ),
                const SizedBox(height: AppSize.s50,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
