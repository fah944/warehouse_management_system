import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/utils/app_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/style_manager.dart';
import '../../../../widget/circular_icon_widget.dart';
import '../../../../widget/custom_dialog_widget.dart';
import '../../../../widget/elevated_btn_widget.dart';
import '../../manager/create_report_cubit/create_report_cubit.dart';
import '../../manager/create_report_cubit/create_report_state.dart';
import 'reports_list_view.dart';

class AllReportViewBody extends StatelessWidget {
  AllReportViewBody({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateReportCubit, CreateReportState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            top: AppPadding.p16,
            bottom: AppPadding.p16,
            start: AppPadding.p16,
            end: AppPadding.p16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Tooltip(
                            message: AppLocalizations.of(context).translate('add_report'),
                            child: elevatedbtn(
                              icon: circleIconWidget(
                                icon: Icons.add,
                                backgroundColor: ColorManager.orange,
                                color: ColorManager.bc0,
                              ),
                              text: AppLocalizations.of(context).translate('add_new_report'),
                              style: StyleManager.labelMedium(color: ColorManager.bc4),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomBigDialogFieldWidget(
                                      title: AppLocalizations.of(context).translate('add_new_report'),
                                      hintText: AppLocalizations.of(context).translate('enter_title'),
                                      hintText2: AppLocalizations.of(context).translate('enter_body'),
                                      controller: titleController,
                                      controller2: bodyController,
                                      onPressedIcon: () {
                                        CreateReportCubit.get(context).pickFile();
                                      },
                                      onPressed: () {
                                        final createReportCubit = context.read<CreateReportCubit>();
                                        createReportCubit.fetchCreateReport(title: titleController.text, file: CreateReportCubit.get(context).selectedFile, body: bodyController.text,);
                                        Navigator.pop(context);
                                      },
                                      validator: (value) {},
                                      validator2: (value) {},
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    /*Container(
                    constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 45.0,
                    ),
                    padding:const EdgeInsetsDirectional.symmetric(
                      //vertical: AppPadding.p16,
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
                          AppLocalizations.of(context).translate('rank'),
                          style: StyleManager.body1Regular(),
                        ),
                        const SizedBox(width: AppSize.s50,),
                        Center(
                          child: Text(
                            AppLocalizations.of(context).translate('name'),
                            style: StyleManager.body1Regular(color: ColorManager.blackColor),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          AppLocalizations.of(context).translate('quantity'),
                          style: StyleManager.body1Regular(color: ColorManager.blackColor),
                        ),
                        const SizedBox(height: AppSize.s50,),
                        const Spacer(),
                      ],
                    ),
                  )*/
                  ],
                ),
                const SizedBox(
                  height: AppSize.s24,
                ),
                const ReportsListView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
