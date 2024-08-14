import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_manager.dart';
import '../../../../../../../core/utils/color_manager.dart';
import '../../../../../../../core/utils/style_manager.dart';
import '../../../../../../../widgets/icon_btn_widget.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../widget/custom_dialog_widget.dart';
import '../../../data/models/all_items_model.dart';
import '../../manager/consume_item_cubit/consume_item_cubit.dart';
import '../../manager/delete_item_cubit/delete_item_cubit.dart';
import '../update_item_view.dart';

class ItemListViewItem extends StatelessWidget {
  ItemListViewItem({Key? key, required this.allItems, required this.rank}) : super(key: key);

  final DataView allItems;
  final int rank;
  final TextEditingController decreaseQuantityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width / 1,
            height: 80.0,
          ),
          padding:const EdgeInsetsDirectional.symmetric(
            vertical: AppPadding.p16,
            horizontal: AppPadding.p16,
          ),
          decoration: BoxDecoration(
            color: ColorManager.bc2,
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                rank.toString(),
                style: StyleManager.body1Regular(),
              ),
              const SizedBox(width: AppSize.s50,),
              Center(
                child: Text(
                  allItems.name,
                  style: StyleManager.body1Regular(color: ColorManager.blackColor),
                ),
              ),
              const Spacer(),
              Text(
                allItems.quantity.toString(),
                style: StyleManager.body1Regular(color: ColorManager.blackColor),
              ),
              const SizedBox(width: AppSize.s50,),
              const Spacer(),
              Tooltip(
                message: AppLocalizations.of(context).translate('withdraw'),
                child: IconBtnWidget(
                  onPressed: ()
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialogFieldWidget(
                          title: AppLocalizations.of(context).translate('withdraw_items'),
                          hintText: AppLocalizations.of(context).translate('enter_quantity'),
                          controller: decreaseQuantityController,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return AppLocalizations.of(context).translate('validate_field_empty');
                            } else {
                              if (allItems.quantity < int.parse(decreaseQuantityController.text)) {
                                return AppLocalizations.of(context).translate('validate_quantity');
                              }
                            }
                            return null;
                          },
                          onPressed: () {
                            ConsumeItemCubit.get(context).fetchConsumeItem(
                              id: allItems.id,
                              quantityConsume: int.parse(decreaseQuantityController.text),
                            );
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                  icon: Icons.output_outlined,
                  color: ColorManager.blue2,
                ),
              ),
              Tooltip(
                message: AppLocalizations.of(context).translate('update'),
                child: IconBtnWidget(
                  onPressed: ()
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdateItemView(
                          allItems: allItems,
                        ),),
                    );
                  },
                  icon: Icons.edit,
                  color: ColorManager.blue2,
                ),
              ),
              Tooltip(
                message: AppLocalizations.of(context).translate('delete'),
                child: IconBtnWidget(
                  onPressed: ()
                  {
                    log('message1');
                    CustomAlertDialogWidget(
                      message: AppLocalizations.of(context).translate('make_sure_delete'),
                      buttonText1: AppLocalizations.of(context).translate('delete'),
                      onPressed1: () {
                        DeleteItemCubit.get(context).fetchDeleteItem(id: allItems.id);
                      },
                      buttonText2: AppLocalizations.of(context).translate('cancel'),
                      onPressed2: () {
                        Navigator.pop(context);
                      },
                    );
                    log('message2');
                  },
                  icon: Icons.delete,
                  color: ColorManager.orange,
                ),
              ),
              const SizedBox(height: AppSize.s20,),
            ],
          ),
        )
      ],
    );
  }
}
