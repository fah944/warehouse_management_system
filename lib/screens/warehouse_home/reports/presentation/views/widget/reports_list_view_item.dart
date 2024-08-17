import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/utils/app_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/style_manager.dart';
import '../../../../../../widgets/icon_btn_widget.dart';
import '../../../../widget/custom_dialog_widget.dart';
import '../../../data/models/all_report_model.dart';
import '../../manager/delete_report_cubit/delete_report_cubit.dart';
import '../../manager/get_file_cubit/get_file_cubit.dart';

class ReportsListViewItem extends StatelessWidget {
  ReportsListViewItem({Key? key, required this.allReports, required this.rank}) : super(key: key);

  final DataReport allReports;
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
            height: 100.0,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      allReports.title!,
                      style: StyleManager.h3Medium(color: ColorManager.blackColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    allReports.body!,
                    style: StyleManager.body1Regular(color: ColorManager.blackColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(width: AppSize.s50,),
              const Spacer(),
              Tooltip(
                message: AppLocalizations.of(context).translate('delete'),
                child: IconBtnWidget(
                  onPressed: ()
                  {
                    DeleteReportCubit.get(context).fetchDeleteReport(id: allReports.id);
                    /*log('message1');
                    CustomAlertDialogWidget(
                      message: AppLocalizations.of(context).translate('make_sure_delete'),
                      buttonText1: AppLocalizations.of(context).translate('delete'),
                      onPressed1: () {
                        DeleteReportCubit.get(context).fetchDeleteReport(id: allReports.id);
                      },
                      buttonText2: AppLocalizations.of(context).translate('cancel'),
                      onPressed2: () {
                        Navigator.pop(context);
                      },
                    );
                    log('message2');*/
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
