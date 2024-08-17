import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/utils/color_manager.dart';
import '../../../../../../../core/utils/style_manager.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../staff/presentation/views/widgets/custom_edit_text_field.dart';
import '../../manager/create_item_cubit/create_item_cubit.dart';
import '../../manager/create_item_cubit/create_item_state.dart';

class CreateItemViewBody extends StatelessWidget {
  CreateItemViewBody({Key? key, required this.typeId, required this.categoryId}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController? expiredDateController = TextEditingController();
  final TextEditingController? minimumQuantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final int typeId;
  final int categoryId;
  final int paginate = 50;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateItemCubit, CreateItemState>(
      listener: (BuildContext context, state) {
        if (state is CreateItemSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).translate('item_submitted_successfully'))),
          );
        } else if (state is CreateItemFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).translate('item_created_failed'))),
          );
        }
      },
      builder: (context, state) {
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
                    readOnly: true,
                    controller: expiredDateController,
                    hintText: AppLocalizations.of(context).translate('expired_date'),
                    validator: (value) {
                      return null;
                    },
                    textCapitalization: TextCapitalization.words,
                    enabled: true,
                    obscureText: false,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2024-02-08'),
                      ).then((value) {
                        //Tuesday Oct 03
                        expiredDateController!.text = '${DateFormat.EEEE().format(value!)} ${DateFormat.MMMd().format(value)}';
                      });
                      log(expiredDateController!.text);
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * .02),
                  CustomEditTextField(
                    controller: minimumQuantityController,
                    hintText: AppLocalizations.of(context).translate('minimum_quantity'),
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
                          onPressed: state is CreateItemLoading ? () {} : (){
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
                            CreateItemCubit.get(context).fetchCreateItem(
                              name: nameController.text,
                              typeId: typeId,
                              categoryId: categoryId,
                              quantity: int.parse(quantityController.text),
                              description: descriptionController.text,
                              expiredDate: expiredDateController?.text,
                              minimumQuantity: minimumQuantityController!.text.isNotEmpty ? int.parse(minimumQuantityController!.text) : null,
                            );
                          },
                          child: state is CreateItemLoading ? const Center(child: CircularProgressIndicator()) : Text(AppLocalizations.of(context).translate('create'), style: StyleManager.h4Regular(color: ColorManager.bc0)),
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
