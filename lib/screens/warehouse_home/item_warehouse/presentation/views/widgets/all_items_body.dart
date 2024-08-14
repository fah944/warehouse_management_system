import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../core/utils/app_manager.dart';
import '../../../../../../../core/utils/color_manager.dart';
import '../../../../../../../core/utils/style_manager.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../warehouse_home/widget/circular_icon_widget.dart';
import '../../manager/export_to_excel_cubit/export_to_excel_cubit.dart';
import '../../manager/export_to_excel_cubit/export_to_excel_state.dart';
import '../../manager/get_all_items_cubit/get_all_items_cubit.dart';
import '../../manager/import_from_excel_cubit/import_from_excel_cubit.dart';
import '../../manager/import_from_excel_cubit/import_from_excel_state.dart';
import '../create_item_view.dart';
import '../search_view.dart';
import 'item_list_view.dart';

class AllItemsBody extends StatelessWidget {
  const AllItemsBody({Key? key, required this.typeId, required this.categoryId}) : super(key: key);

  final int typeId;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    ImportFromExcelCubit importCubit = ImportFromExcelCubit.get(context);
    return BlocConsumer<ImportFromExcelCubit, ImportFromExcelState>(
      listener: (contextImport, stateImport) {
        if(stateImport is SelectedFileSuccess) {
          ImportFromExcelCubit.get(context).fetchImportFromExcel(
            excelFile: importCubit.selectedImage!,
          );
        }
        if (stateImport is ImportFromExcelFailure) {
          ScaffoldMessenger.of(contextImport).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).translate('import_items_failed'))),
          );
        } else if (stateImport is ImportFromExcelSuccess) {
          contextImport.read<GetAllItemsCubit>().fetchAllItems(
              paginate: 50,
          );
          ScaffoldMessenger.of(contextImport).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).translate('items_imported_successfully'))),
          );
        } else if (stateImport is SelectedFileFailure) {
          ScaffoldMessenger.of(contextImport).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).translate('file_picked_failed'))),
          );
        } else if (stateImport is SelectedFileEmpty) {
          ScaffoldMessenger.of(contextImport).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).translate('pick_file_first'))),
          );
        }
      },
      builder: (contextImport, stateImport) {
        return BlocConsumer<ExportToExcelCubit, ExportToExcelState>(
          listener: (context, state) {
            if (state is ExportToExcelFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context).translate('export_items_failed'))),
              );
            } else if (state is ExcelFileSaveSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context).translate('items_exported_successfully'))),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(
                top: AppPadding.p16,
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
                                message: AppLocalizations.of(context).translate('import_items'),
                                child: GestureDetector(
                                  onTap: () {
                                    ImportFromExcelCubit.get(context).pickImage();
                                  },
                                  child: circleIconWidget(
                                      icon: FontAwesomeIcons.fileImport,
                                      backgroundColor: Colors.transparent,
                                      color: ColorManager.blue,
                                      radius: 30.0,
                                      size: 25.0
                                  ),
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context).translate('export_items'),
                                child: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<ExportToExcelCubit>(context).fetchExportToExcel(fields: ["id","name","quantity"]);
                                  },
                                  child: circleIconWidget(
                                      icon: FontAwesomeIcons.fileExport,
                                      backgroundColor: Colors.transparent,
                                      color: ColorManager.blue,
                                      radius: 30.0,
                                      size: 25.0
                                  ),
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context).translate('search'),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) => SearchView(
                                          typeId: typeId,
                                          categoryId: categoryId,
                                        ),
                                        transitionDuration: Duration.zero,
                                        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                                      ),
                                    );
                                  },
                                  child: circleIconWidget(
                                      icon: Icons.search_sharp,
                                      backgroundColor: Colors.transparent,
                                      color: ColorManager.blue,
                                      size: AppSize.s30,
                                      radius: AppSize.s20,
                                  ),
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context).translate('add_item'),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CreateItemView(
                                        typeId: typeId,
                                        categoryId: categoryId,
                                      ),),
                                    );
                                  },
                                  child: circleIconWidget(
                                    icon: Icons.add_circle_outline,
                                    backgroundColor: Colors.transparent,
                                    color: ColorManager.blue,
                                    size: AppSize.s30,
                                    radius: AppSize.s20,
                                  ),
                                ),
                              ),
                              /*elevatedbtn(
                                icon: circleIconWidget(
                                  icon: Icons.add,
                                  backgroundColor: ColorManager.orange,
                                  color: ColorManager.bc0,
                                ),
                                text: 'Add New Category',
                                style: StyleManager.labelMedium(color: ColorManager.bc4),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CreateItemView(
                                      typeId: typeId,
                                      categoryId: categoryId,
                                    ),),
                                  );
                                },
                              ),*/
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Container(
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
                        )
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s24,
                    ),
                    const ItemListView(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
