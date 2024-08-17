import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../Bloc/manager/pending_beneficiary_cubit.dart';
import '../../../core/utils/color_manager.dart';
import '../../../models/Pending Model/pending_beneficiary_request_model.dart';
import '../../../widgets/general_widgets/common_scaffold.dart';
import '../../../widgets/manager_home_widgets/update_manager_widgets/disability_manager_update_widget.dart';
import '../../../widgets/manager_home_widgets/update_manager_widgets/educational_attainment_manager_update_widget.dart';
import '../../../widgets/manager_home_widgets/update_manager_widgets/foreign_language_manager_manager_widget .dart';
import '../../../widgets/manager_home_widgets/update_manager_widgets/previous_training_course_manager_update_widget.dart';
import '../../../widgets/manager_home_widgets/update_manager_widgets/professional_skill__manager_update_widget.dart';

class BeneficiaryEditManagerScreen extends StatelessWidget {
  final DataRequest beneficiary;
  final VoidCallback onPop;

  BeneficiaryEditManagerScreen({
    required this.beneficiary,
    required this.onPop,
  });

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    // Accessing fields within RequsetPending
    late RequsetPending reqPending = beneficiary.requsetPending!;
    late int _serialNumber = reqPending.serialNumber ?? 0;
    late String _date = reqPending.date ?? '';
    late String _province = reqPending.province ?? '';
    late String _name = reqPending.name ?? '';
    late String _fatherName = reqPending.fatherName ?? '';
    late String _motherName = reqPending.motherName ?? '';
    late String _gender = reqPending.gender ?? '';
    late String _dateOfBirth = reqPending.dateOfBirth ?? '';
    late String _nots = reqPending.nots ?? '';
    late String _maritalStatus = reqPending.maritalStatus ?? '';
    late String _needAttendant = reqPending.needAttendant ?? '';
    late int _numberFamilyMember = reqPending.numberFamilyMember ?? 0;
    late String _losingBreadwinner = reqPending.losingBreadwinner ?? '';
    late String _governorate = reqPending.governorate ?? '';
    late String _address = reqPending.address ?? '';
    late String _email = reqPending.email ?? '';
    late String _numberLine = reqPending.numberline ?? '';
    late String _numberPhone = reqPending.numberPhone ?? '';
    late String _numberId = reqPending.numberId ?? '';
    late String _computerDriving = reqPending.computerDriving ?? '';
    late String _computerSkills = reqPending.computerSkills ?? '';
    late String _sectorPreferences = reqPending.sectorPreferences ?? '';
    late String _employment = reqPending.employment ?? '';
    late String _supportRequiredTrainingLearning = reqPending.supportRequiredTrainingLearning ?? '';
    late String _supportRequiredEntrepreneurship = reqPending.supportRequiredEntrepreneurship ?? '';
    late String _careerGuidanceCounselling = reqPending.careerGuidanceCounselling ?? '';
    late String _generalNotes = reqPending.generalNotes ?? '';

    return CommonScaffold(
      title: 'Update Beneficiary',
      scaffoldKey: GlobalKey<ScaffoldState>(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildRow([
                    _buildTextFormField('Serial Number', _serialNumber.toString(), (value) => _serialNumber = int.parse(value!)),
                    _buildTextFormField('Date', _date, (value) => _date = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Province', _province, (value) => _province = value!),
                    _buildTextFormField('Name', _name, (value) => _name = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Father Name', _fatherName, (value) => _fatherName = value!),
                    _buildTextFormField('Mother Name', _motherName, (value) => _motherName = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Gender', _gender, (value) => _gender = value!),
                    _buildTextFormField('Date of Birth', _dateOfBirth, (value) => _dateOfBirth = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Notes', _nots, (value) => _nots = value!),
                    _buildTextFormField('Marital Status', _maritalStatus, (value) => _maritalStatus = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Need Attendant', _needAttendant, (value) => _needAttendant = value!),
                    _buildTextFormField('Number of Family Members', _numberFamilyMember.toString(), (value) => _numberFamilyMember = int.parse(value!))
                  ]),
                  _buildRow([
                    _buildTextFormField('Losing Breadwinner', _losingBreadwinner, (value) => _losingBreadwinner = value!),
                    _buildTextFormField('Governorate', _governorate, (value) => _governorate = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Address', _address, (value) => _address = value!),
                    _buildTextFormField('Email', _email, (value) => _email = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Number Line', _numberLine, (value) => _numberLine = value!),
                    _buildTextFormField('Number Phone', _numberPhone, (value) => _numberPhone = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Number ID', _numberId, (value) => _numberId = value!),
                    _buildTextFormField('Computer Driving', _computerDriving, (value) => _computerDriving = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Computer Skills', _computerSkills, (value) => _computerSkills = value!),
                    _buildTextFormField('Sector Preferences', _sectorPreferences, (value) => _sectorPreferences = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Employment', _employment, (value) => _employment = value!),
                    _buildTextFormField('Support Required for Training & Learning', _supportRequiredTrainingLearning, (value) => _supportRequiredTrainingLearning = value!)
                  ]),
                  _buildRow([
                    _buildTextFormField('Support Required for Entrepreneurship', _supportRequiredEntrepreneurship, (value) => _supportRequiredEntrepreneurship = value!),
                    _buildTextFormField('Career Guidance & Counselling', _careerGuidanceCounselling, (value) => _careerGuidanceCounselling = value!)
                  ]),
                  _buildTextFormField('General Notes', _generalNotes, (value) => _generalNotes = value!),
                  SizedBox(height: 20),
                  DisabilityManagerUpdateWidget(
                    title: 'Personal Disabilities',
                    disabilities: reqPending.thereIsDisbility ?? [],
                  ),
                  DisabilityManagerUpdateWidget(
                    title: 'Family Member Disabilities',
                    disabilities: reqPending.thereIsDisbilityFamilyMember ?? [],
                  ),
                  EducationalAttainmentManagerUpdateWidget(
                    educationalAttainments: reqPending.educationalAttainments ?? [],
                  ),
                  PreviousTrainingCourseManagerUpdateWidget(
                    previousTrainingCourses: reqPending.previousTrainingCourses ?? [],
                  ),
                  ForeignLanguageManagerUpdateWidget(
                    foreignLanguages: reqPending.foreignLanguages ?? [],
                  ),
                  ProfessionalSkillManagerUpdateWidget(
                    professionalSkills: reqPending.professionalSkills ?? [],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Update'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final updatedRequsetPending = RequsetPending(
                          serialNumber: _serialNumber,
                          date: _date,
                          province: _province,
                          name: _name,
                          fatherName: _fatherName,
                          motherName: _motherName,
                          gender: _gender,
                          dateOfBirth: _dateOfBirth,
                          nots: _nots,
                          maritalStatus: _maritalStatus,
                          needAttendant: _needAttendant,
                          numberFamilyMember: _numberFamilyMember,
                          losingBreadwinner: _losingBreadwinner,
                          governorate: _governorate,
                          address: _address,
                          email: _email,
                          numberline: _numberLine,
                          numberPhone: _numberPhone,
                          numberId: _numberId,
                          computerDriving: _computerDriving,
                          computerSkills: _computerSkills,
                          sectorPreferences: _sectorPreferences,
                          employment: _employment,
                          supportRequiredTrainingLearning: _supportRequiredTrainingLearning,
                          supportRequiredEntrepreneurship: _supportRequiredEntrepreneurship,
                          careerGuidanceCounselling: _careerGuidanceCounselling,
                          generalNotes: _generalNotes,
                          thereIsDisbility: reqPending.thereIsDisbility,
                          thereIsDisbilityFamilyMember: reqPending.thereIsDisbilityFamilyMember,
                          educationalAttainments: reqPending.educationalAttainments,
                          previousTrainingCourses: reqPending.previousTrainingCourses,
                          foreignLanguages: reqPending.foreignLanguages,
                          professionalSkills: reqPending.professionalSkills,
                        );

                        // Update the DataRequest object
                        final updatedDataRequest = beneficiary.copyWith(
                          requsetPending: updatedRequsetPending,
                        );

                        context.read<PendingBeneficiaryCubit>().updateBeneficiary(
                          updatedDataRequest.id!,  // Pass the ID
                          _serialNumber,
                          _date,
                          _province,
                          _name,
                          _fatherName,
                          _motherName,
                          _gender,
                          _dateOfBirth,
                          _nots,
                          _maritalStatus,
                          reqPending.thereIsDisbility ?? [],
                          _needAttendant,
                          _numberFamilyMember,
                          reqPending.thereIsDisbilityFamilyMember ?? [],
                          _losingBreadwinner,
                          _governorate,
                          _address,
                          _email,
                          _numberLine,
                          _numberPhone,
                          _numberId,
                          reqPending.educationalAttainments ?? [],
                          reqPending.previousTrainingCourses ?? [],
                          reqPending.foreignLanguages ?? [],
                          _computerDriving,
                          _computerSkills,
                          reqPending.professionalSkills ?? [],
                          _sectorPreferences,
                          _employment,
                          _supportRequiredTrainingLearning,
                          _supportRequiredEntrepreneurship,
                          _careerGuidanceCounselling,
                          _generalNotes,
                        );
                        onPop();
                        context.go('/manager_home?tab=3');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: children
            .map((child) => Expanded(child: Padding(padding: const EdgeInsets.all(8.0), child: child)))
            .toList(),
      ),
    );
  }

  Widget _buildTextFormField(String label, String initialValue, FormFieldSetter<String> onSaved) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
