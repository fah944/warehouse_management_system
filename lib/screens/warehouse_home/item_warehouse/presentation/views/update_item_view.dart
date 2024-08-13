import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/service_locator.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../widgets/general_widgets/common_scaffold.dart';
import '../../data/models/all_items_model.dart';
import '../../data/repos/item_repo_impl.dart';
import '../manager/update_item_cubit/update_item_cubit.dart';
import 'widgets/update_item_view_body.dart';

class UpdateItemView extends StatelessWidget {
  UpdateItemView({Key? key, required this.allItems}) : super(key: key);

  final DataView allItems;
  final _keyScaffold  = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: AppLocalizations.of(context).translate('warehouse_home_title'),
      scaffoldKey: _keyScaffold,
      body: BlocProvider(
        create: (context) {
          return UpdateItemCubit(
            getIt.get<ItemRepoImpl>(),
          );
        },
        child: Container(
          color: Colors.white,
          child: UpdateItemViewBody(
            allItems: allItems,
          ),
        ),
      ),
    );
  }
}
