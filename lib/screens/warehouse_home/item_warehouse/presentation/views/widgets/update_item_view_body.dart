import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/color_manager.dart';
import '../../../../../../../core/utils/style_manager.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../staff/presentation/views/widgets/custom_edit_text_field.dart';
import '../../../data/models/all_items_model.dart';
import '../../manager/update_item_cubit/update_item_cubit.dart';
import '../../manager/update_item_cubit/update_item_state.dart';

class UpdateItemViewBody extends StatelessWidget {
  UpdateItemViewBody({Key? key, required this.allItems}) : super(key: key);

  TextEditingController? nameController;
  TextEditingController? quantityController;
  TextEditingController? descriptionController;
  TextEditingController? expiredDateController;
  final _formKey = GlobalKey<FormState>();
  final DataView allItems;

  @override
  Widget build(BuildContext context) {
    nameController = TextEditingController(text: allItems.name);
    quantityController = TextEditingController(text: allItems.quantity.toString());
    descriptionController = TextEditingController(text: allItems.description);
    expiredDateController = TextEditingController(text: allItems.expiredDate);
    return BlocConsumer<UpdateItemCubit, UpdateItemState>(
      listener: (BuildContext context, state) {
        if (state is UpdateItemSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).translate('item_updated_successfully'))),
          );
        } else if (state is UpdateItemFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).translate('item_updated_failed'))),
          );
        }
      },
      builder: (BuildContext context, Object? state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 3,
            vertical: MediaQuery.of(context).size.width / 79,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.width * .02),
                  CustomEditTextField(
                    hintText: AppLocalizations.of(context).translate('name'),
                    controller: nameController,
                    validator: (value) => value!.isEmpty ? AppLocalizations.of(context).translate('validate_required') : null,
                    textCapitalization: TextCapitalization.words,
                    enabled: true,
                    obscureText: false,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * .02),
                  CustomEditTextField(
                    controller: quantityController,
                    hintText: AppLocalizations.of(context).translate('quantity'),
                    validator: (value) => value!.isEmpty ? AppLocalizations.of(context).translate('validate_required') : null,
                    textCapitalization: TextCapitalization.words,
                    enabled: true,
                    obscureText: false,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * .02),
                  CustomEditTextField(
                    controller: descriptionController,
                    hintText: AppLocalizations.of(context).translate('description'),
                    validator: (value) => value!.isEmpty ? AppLocalizations.of(context).translate('validate_required') : null,
                    enabled: true,
                    obscureText: false,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * .02),
                  CustomEditTextField(
                    controller: expiredDateController,
                    hintText: AppLocalizations.of(context).translate('expired_date'),
                    validator: null,
                    textCapitalization: TextCapitalization.words,
                    enabled: true,
                    obscureText: false,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * .02),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(ColorManager.bluelight),
                          ),
                          onPressed: state is UpdateItemLoading ? () {} : (){
                            Navigator.pop(context);
                          },
                          child: Text(AppLocalizations.of(context).translate('cancel'), style: StyleManager.h4Regular(color: ColorManager.bc0)),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(ColorManager.bluelight),
                          ),
                          onPressed: (){
                            UpdateItemCubit.get(context).fetchUpdateItem(
                              id: allItems.id,
                              name: nameController!.text,
                              expiredDate: expiredDateController!.text,
                              quantity: int.parse(quantityController!.text),
                              description: descriptionController!.text,
                              typeId: allItems.typeId,
                              categoryId: allItems.categoryId,
                            );
                          },
                          child: state is UpdateItemLoading ? const Center(child: CircularProgressIndicator()) : Text('Save', style: StyleManager.h4Regular(color: ColorManager.bc0)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
