import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../core/localization/app_localizations.dart';
import '../../../../../../../core/utils/app_manager.dart';
import '../../../../../../../core/utils/color_manager.dart';
import '../../../../../../../core/utils/style_manager.dart';
import '../../../../../../warehouse_home/item_warehouse/presentation/manager/export_to_excel_cubit/export_to_excel_cubit.dart';
import '../../../../../../warehouse_home/item_warehouse/presentation/manager/export_to_excel_cubit/export_to_excel_state.dart';
import '../../../../../../warehouse_home/widget/circular_icon_widget.dart';
import '../search_view_manager.dart';
import 'item_list_view_manager.dart';

class AllItemViewBodyManager extends StatelessWidget {
  const AllItemViewBodyManager({Key? key, required this.typeId, required this.categoryId}) : super(key: key);

  final int typeId;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
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
        return DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              top: AppPadding.p16,
              bottom: AppPadding.p16,
              start: AppPadding.p16,
              end: AppPadding.p16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                pageBuilder: (_, __, ___) => SearchViewManager(
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                // Add TabBar in the AppBar
                SizedBox(
                  height: AppSize.s50,
                  child: AppBar(
                    bottom: const TabBar(
                      indicatorColor: ColorManager.bc4,
                      labelColor: ColorManager.bc4,
                      unselectedLabelColor: ColorManager.bc5,
                      tabs: [
                        Tab(text: 'All Items'),
                        Tab(text: 'Expiring Items'), // اسم التاب الثاني
                        Tab(text: 'Expired Items'), // اسم التاب الثاني
                      ],
                    ),
                  ),
                ),
                // Add TabBarView for displaying content
                const Expanded(
                  child: TabBarView(
                    children: [
                      ItemListView(), // القائمة الأولى
                      ExpiringItemListView(), // القائمة الثانية
                      ExpiredItemListView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
/*Padding(
      padding: const EdgeInsetsDirectional.only(
        top: AppPadding.p16,
        bottom: AppPadding.p16,
        start: AppPadding.p16,
        end: AppPadding.p16,
      ),
      child: SingleChildScrollView(
        child: Column(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => SearchViewManager(
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
                            radius: 30.0,
                            size: 25.0
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s24,
                ),
                Container(
                  constraints: BoxConstraints.tightFor(
                    width: MediaQuery.of(context).size.width / 1,
                    height: 50.0,
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
            const ItemListViewManager(),
          ],
        ),
      ),
    )*/
