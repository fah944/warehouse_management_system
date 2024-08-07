// class PendingBeneficiaryRequest {
//   String? message;
//   List<DataRequest>? dataRequest;
//
//   PendingBeneficiaryRequest({this.message, this.dataRequest});
//
//   PendingBeneficiaryRequest.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['dataRequest'] != null) {
//       dataRequest = <DataRequest>[];
//       json['dataRequest'].forEach((v) {
//         dataRequest!.add(DataRequest.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = this.message;
//     if (this.dataRequest != null) {
//       data['dataRequest'] = this.dataRequest!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class DataRequest {
//   int? id;
//   RequsetPending? requsetPending;
//   String? status;
//   String? type;
//   String? createdAt;
//   String? updatedAt;
//
//   DataRequest(
//       {this.id,
//         this.requsetPending,
//         this.status,
//         this.type,
//         this.createdAt,
//         this.updatedAt});
//
//   DataRequest.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     requsetPending = json['requsetPending'] != null
//         ? RequsetPending.fromJson(json['requsetPending'])
//         : null;
//     status = json['status'];
//     type = json['type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = this.id;
//     if (this.requsetPending != null) {
//       data['requsetPending'] = this.requsetPending!.toJson();
//     }
//     data['status'] = this.status;
//     data['type'] = this.type;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class RequsetPending {
//   int? serialNumber;
//   String? date;
//   String? province;
//   String? name;
//   String? fatherName;
//   String? motherName;
//   String? gender;
//   String? dateOfBirth;
//   String? nots;
//   String? maritalStatus;
//   List<ThereIsDisbility>? thereIsDisbility;
//   String? needAttendant;
//   int? numberFamilyMember;
//   List<ThereIsDisbilityFamilyMember>? thereIsDisbilityFamilyMember;
//   String? losingBreadwinner;
//   String? governorate;
//   String? address;
//   String? email;
//   String? numberline;
//   String? numberPhone;
//   String? numberId;
//   List<EducationalAttainment>? educationalAttainment;
//   List<PreviousTrainingCourses>? previousTrainingCourses;
//   List<ForeignLanguages>? foreignLanguages;
//   String? computerDriving;
//   String? computerSkills;
//   List<ProfessionalSkills>? professionalSkills;
//   String? sectorPreferences;
//   String? employment;
//   String? supportRequiredTrainingLearning;
//   String? supportRequiredEntrepreneurship;
//   String? careerGuidanceCounselling;
//   String? generalNotes;
//
//   RequsetPending(
//       {this.serialNumber,
//         this.date,
//         this.province,
//         this.name,
//         this.fatherName,
//         this.motherName,
//         this.gender,
//         this.dateOfBirth,
//         this.nots,
//         this.maritalStatus,
//         this.thereIsDisbility,
//         this.needAttendant,
//         this.numberFamilyMember,
//         this.thereIsDisbilityFamilyMember,
//         this.losingBreadwinner,
//         this.governorate,
//         this.address,
//         this.email,
//         this.numberline,
//         this.numberPhone,
//         this.numberId,
//         this.educationalAttainment,
//         this.previousTrainingCourses,
//         this.foreignLanguages,
//         this.computerDriving,
//         this.computerSkills,
//         this.professionalSkills,
//         this.sectorPreferences,
//         this.employment,
//         this.supportRequiredTrainingLearning,
//         this.supportRequiredEntrepreneurship,
//         this.careerGuidanceCounselling,
//         this.generalNotes});
//
//   RequsetPending.fromJson(Map<String, dynamic> json) {
//     serialNumber = json['serialNumber'];
//     date = json['date'];
//     province = json['province'];
//     name = json['name'];
//     fatherName = json['fatherName'];
//     motherName = json['motherName'];
//     gender = json['gender'];
//     dateOfBirth = json['dateOfBirth'];
//     nots = json['nots'];
//     maritalStatus = json['maritalStatus'];
//     if (json['thereIsDisbility'] != null) {
//       thereIsDisbility = <ThereIsDisbility>[];
//       json['thereIsDisbility'].forEach((v) {
//         thereIsDisbility!.add(ThereIsDisbility.fromJson(v));
//       });
//     }
//     needAttendant = json['needAttendant'];
//     numberFamilyMember = json['NumberFamilyMember'];
//     if (json['thereIsDisbilityFamilyMember'] != null) {
//       thereIsDisbilityFamilyMember = <ThereIsDisbilityFamilyMember>[];
//       json['thereIsDisbilityFamilyMember'].forEach((v) {
//         thereIsDisbilityFamilyMember!.add(ThereIsDisbilityFamilyMember.fromJson(v));
//       });
//     }
//     losingBreadwinner = json['losingBreadwinner'];
//     governorate = json['governorate'];
//     address = json['address'];
//     email = json['email'];
//     numberline = json['numberline'];
//     numberPhone = json['numberPhone'];
//     numberId = json['numberId'];
//     if (json['educationalAttainment'] != null) {
//       educationalAttainment = <EducationalAttainment>[];
//       json['educationalAttainment'].forEach((v) {
//         educationalAttainment!.add(EducationalAttainment.fromJson(v));
//       });
//     }
//     if (json['previousTrainingCourses'] != null) {
//       previousTrainingCourses = <PreviousTrainingCourses>[];
//       json['previousTrainingCourses'].forEach((v) {
//         previousTrainingCourses!.add(PreviousTrainingCourses.fromJson(v));
//       });
//     }
//     if (json['foreignLanguages'] != null) {
//       foreignLanguages = <ForeignLanguages>[];
//       json['foreignLanguages'].forEach((v) {
//         foreignLanguages!.add(ForeignLanguages.fromJson(v));
//       });
//     }
//     computerDriving = json['computerDriving'];
//     computerSkills = json['computerSkills'];
//     if (json['professionalSkills'] != null) {
//       professionalSkills = <ProfessionalSkills>[];
//       json['professionalSkills'].forEach((v) {
//         professionalSkills!.add(ProfessionalSkills.fromJson(v));
//       });
//     }
//     sectorPreferences = json['sectorPreferences'];
//     employment = json['employment'];
//     supportRequiredTrainingLearning = json['supportRequiredTrainingLearning'];
//     supportRequiredEntrepreneurship = json['supportRequiredEntrepreneurship'];
//     careerGuidanceCounselling = json['careerGuidanceCounselling'];
//     generalNotes = json['generalNotes'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['serialNumber'] = this.serialNumber;
//     data['date'] = this.date;
//     data['province'] = this.province;
//     data['name'] = this.name;
//     data['fatherName'] = this.fatherName;
//     data['motherName'] = this.motherName;
//     data['gender'] = this.gender;
//     data['dateOfBirth'] = this.dateOfBirth;
//     data['nots'] = this.nots;
//     data['maritalStatus'] = this.maritalStatus;
//     if (this.thereIsDisbility != null) {
//       data['thereIsDisbility'] = this.thereIsDisbility!.map((v) => v.toJson()).toList();
//     }
//     data['needAttendant'] = this.needAttendant;
//     data['NumberFamilyMember'] = this.numberFamilyMember;
//     if (this.thereIsDisbilityFamilyMember != null) {
//       data['thereIsDisbilityFamilyMember'] = this.thereIsDisbilityFamilyMember!.map((v) => v.toJson()).toList();
//     }
//     data['losingBreadwinner'] = this.losingBreadwinner;
//     data['governorate'] = this.governorate;
//     data['address'] = this.address;
//     data['email'] = this.email;
//     data['numberline'] = this.numberline;
//     data['numberPhone'] = this.numberPhone;
//     data['numberId'] = this.numberId;
//     if (this.educationalAttainment != null) {
//       data['educationalAttainment'] = this.educationalAttainment!.map((v) => v.toJson()).toList();
//     }
//     if (this.previousTrainingCourses != null) {
//       data['previousTrainingCourses'] = this.previousTrainingCourses!.map((v) => v.toJson()).toList();
//     }
//     if (this.foreignLanguages != null) {
//       data['foreignLanguages'] = this.foreignLanguages!.map((v) => v.toJson()).toList();
//     }
//     data['computerDriving'] = this.computerDriving;
//     data['computerSkills'] = this.computerSkills;
//     if (this.professionalSkills != null) {
//       data['professionalSkills'] = this.professionalSkills!.map((v) => v.toJson()).toList();
//     }
//     data['sectorPreferences'] = this.sectorPreferences;
//     data['employment'] = this.employment;
//     data['supportRequiredTrainingLearning'] = this.supportRequiredTrainingLearning;
//     data['supportRequiredEntrepreneurship'] = this.supportRequiredEntrepreneurship;
//     data['careerGuidanceCounselling'] = this.careerGuidanceCounselling;
//     data['generalNotes'] = this.generalNotes;
//     return data;
//   }
// }
//
// class ThereIsDisbility {
//   String? nameDisbility;
//   String? rateDisbility;
//
//   ThereIsDisbility({this.nameDisbility, this.rateDisbility});
//
//   ThereIsDisbility.fromJson(Map<String, dynamic> json) {
//     nameDisbility = json['nameDisbility'];
//     rateDisbility = json['rateDisbility'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['nameDisbility'] = this.nameDisbility;
//     data['rateDisbility'] = this.rateDisbility;
//     return data;
//   }
// }
//
// class ThereIsDisbilityFamilyMember {
//   String? nameDisbility;
//   String? rateDisbility;
//
//   ThereIsDisbilityFamilyMember({this.nameDisbility, this.rateDisbility});
//
//   ThereIsDisbilityFamilyMember.fromJson(Map<String, dynamic> json) {
//     nameDisbility = json['nameDisbility'];
//     rateDisbility = json['rateDisbility'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['nameDisbility'] = this.nameDisbility;
//     data['rateDisbility'] = this.rateDisbility;
//     return data;
//   }
// }
//
// class EducationalAttainment {
//   String? educationalAttainmentLevel;
//   String? specialization;
//   String? certificate;
//   String? graduationRate;
//   String? academicYear;
//
//   EducationalAttainment(
//       {this.educationalAttainmentLevel,
//         this.specialization,
//         this.certificate,
//         this.graduationRate,
//         this.academicYear});
//
//   EducationalAttainment.fromJson(Map<String, dynamic> json) {
//     educationalAttainmentLevel = json['educationalAttainmentLevel'];
//     specialization = json['specialization'];
//     certificate = json['certificate'];
//     graduationRate = json['graduationRate'];
//     academicYear = json['academicYear'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['educationalAttainmentLevel'] = this.educationalAttainmentLevel;
//     data['specialization'] = this.specialization;
//     data['certificate'] = this.certificate;
//     data['graduationRate'] = this.graduationRate;
//     data['academicYear'] = this.academicYear;
//     return data;
//   }
// }
//
// class PreviousTrainingCourses {
//   String? certificateAndType;
//   String? executingAgency;
//   String? dateExecute;
//
//   PreviousTrainingCourses(
//       {this.certificateAndType, this.executingAgency, this.dateExecute});
//
//   PreviousTrainingCourses.fromJson(Map<String, dynamic> json) {
//     certificateAndType = json['certificateAndType'];
//     executingAgency = json['executingAgency'];
//     dateExecute = json['dateExecute'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['certificateAndType'] = this.certificateAndType;
//     data['executingAgency'] = this.executingAgency;
//     data['dateExecute'] = this.dateExecute;
//     return data;
//   }
// }
//
// class ForeignLanguages {
//   String? namelanguage;
//   String? level;
//
//   ForeignLanguages({this.namelanguage, this.level});
//
//   ForeignLanguages.fromJson(Map<String, dynamic> json) {
//     namelanguage = json['namelanguage'];
//     level = json['level'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['namelanguage'] = this.namelanguage;
//     data['level'] = this.level;
//     return data;
//   }
// }
//
// class ProfessionalSkills {
//   String? jobTitle;
//   String? start;
//   String? end;
//   String? jobTasks;
//
//   ProfessionalSkills({this.jobTitle, this.start, this.end, this.jobTasks});
//
//   ProfessionalSkills.fromJson(Map<String, dynamic> json) {
//     jobTitle = json['jobTitle'];
//     start = json['start'];
//     end = json['end'];
//     jobTasks = json['jobTasks'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['jobTitle'] = this.jobTitle;
//     data['start'] = this.start;
//     data['end'] = this.end;
//     data['jobTasks'] = this.jobTasks;
//     return data;
//   }
// }


class PendingBeneficiaryRequest {
  String? message;
  List<DataRequest>? dataRequest;

  PendingBeneficiaryRequest({this.message, this.dataRequest});

  factory PendingBeneficiaryRequest.fromJson(Map<String, dynamic> json) {
    return PendingBeneficiaryRequest(
      message: json['message'],
      dataRequest: json['dataRequest'] != null
          ? (json['dataRequest'] as List)
          .map((v) => DataRequest.fromJson(v))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'dataRequest': dataRequest?.map((v) => v.toJson()).toList(),
    };
  }
}

class DataRequest {
  int? id;
  RequsetPending? requsetPending;
  String? status;
  String? type;
  String? createdAt;
  String? updatedAt;

  DataRequest({this.id, this.requsetPending, this.status, this.type, this.createdAt, this.updatedAt});

  factory DataRequest.fromJson(Map<String, dynamic> json) {
    return DataRequest(
      id: json['id'],
      requsetPending: json['requsetPending'] != null ? RequsetPending.fromJson(json['requsetPending']) : null,
      status: json['status'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'requsetPending': requsetPending?.toJson(),
      'status': status,
      'type': type,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class RequsetPending {
  int? serialNumber;
  String? date;
  String? province;
  String? name;
  String? fatherName;
  String? motherName;
  String? gender;
  String? dateOfBirth;
  String? nots;
  String? maritalStatus;
  List<Disabilities>? thereIsDisbility;
  List<Disabilities>? thereIsDisbilityFamilyMember;
  String? needAttendant;
  int? numberFamilyMember;
  String? losingBreadwinner;
  String? governorate;
  String? address;
  String? email;
  String? numberline;
  String? numberPhone;
  String? numberId;
  List<EducationalAttainments>? educationalAttainments;
  List<PreviousTrainingCourses>? previousTrainingCourses;
  List<ForeignLanguages>? foreignLanguages;
  String? computerDriving;
  String? computerSkills;
  List<ProfessionalSkills>? professionalSkills;
  String? sectorPreferences;
  String? employment;
  String? supportRequiredTrainingLearning;
  String? supportRequiredEntrepreneurship;
  String? careerGuidanceCounselling;
  String? generalNotes;

  RequsetPending({
    this.serialNumber,
    this.date,
    this.province,
    this.name,
    this.fatherName,
    this.motherName,
    this.gender,
    this.dateOfBirth,
    this.nots,
    this.maritalStatus,
    this.thereIsDisbility,
    this.needAttendant,
    this.numberFamilyMember,
    this.thereIsDisbilityFamilyMember,
    this.losingBreadwinner,
    this.governorate,
    this.address,
    this.email,
    this.numberline,
    this.numberPhone,
    this.numberId,
    this.educationalAttainments,
    this.previousTrainingCourses,
    this.foreignLanguages,
    this.computerDriving,
    this.computerSkills,
    this.professionalSkills,
    this.sectorPreferences,
    this.employment,
    this.supportRequiredTrainingLearning,
    this.supportRequiredEntrepreneurship,
    this.careerGuidanceCounselling,
    this.generalNotes,
  });

  factory RequsetPending.fromJson(Map<String, dynamic> json) {
    return RequsetPending(
      serialNumber: json['serialNumber'],
      date: json['date'],
      province: json['province'],
      name: json['name'],
      fatherName: json['fatherName'],
      motherName: json['motherName'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      nots: json['nots'],
      maritalStatus: json['maritalStatus'],
      needAttendant: json['needAttendant'],
      numberFamilyMember: json['NumberFamilyMember'],
      losingBreadwinner: json['losingBreadwinner'],
      governorate: json['governorate'],
      address: json['address'],
      email: json['email'],
      numberline: json['numberline'],
      numberPhone: json['numberPhone'],
      numberId: json['numberId'],
      thereIsDisbility: (json['thereIsDisbility'] as List?)?.map((e) => Disabilities.fromJson(e)).toList(),
      thereIsDisbilityFamilyMember: (json['thereIsDisbilityFamilyMember'] as List?)?.map((e) => Disabilities.fromJson(e)).toList(),
      educationalAttainments: (json['educationalAttainment'] as List?)?.map((e) => EducationalAttainments.fromJson(e)).toList(),
      previousTrainingCourses: (json['previousTrainingCourses'] as List?)?.map((e) => PreviousTrainingCourses.fromJson(e)).toList(),
      foreignLanguages: (json['foreignLanguages'] as List?)?.map((e) => ForeignLanguages.fromJson(e)).toList(),
      professionalSkills: (json['professionalSkills'] as List?)?.map((e) => ProfessionalSkills.fromJson(e)).toList(),
      computerDriving: json['computerDriving'],
      computerSkills: json['computerSkills'],
      sectorPreferences: json['sectorPreferences'],
      employment: json['employment'],
      supportRequiredTrainingLearning: json['supportRequiredTrainingLearning'],
      supportRequiredEntrepreneurship: json['supportRequiredEntrepreneurship'],
      careerGuidanceCounselling: json['careerGuidanceCounselling'],
      generalNotes: json['generalNotes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serialNumber': serialNumber,
      'date': date,
      'province': province,
      'name': name,
      'fatherName': fatherName,
      'motherName': motherName,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'nots': nots,
      'maritalStatus': maritalStatus,
      'needAttendant': needAttendant,
      'NumberFamilyMember': numberFamilyMember,
      'losingBreadwinner': losingBreadwinner,
      'governorate': governorate,
      'address': address,
      'email': email,
      'numberline': numberline,
      'numberPhone': numberPhone,
      'numberId': numberId,
      'thereIsDisbility': thereIsDisbility?.map((e) => e.toJson()).toList(),
      'thereIsDisbilityFamilyMember': thereIsDisbilityFamilyMember?.map((e) => e.toJson()).toList(),
      'educationalAttainment': educationalAttainments?.map((e) => e.toJson()).toList(),
      'previousTrainingCourses': previousTrainingCourses?.map((e) => e.toJson()).toList(),
      'foreignLanguages': foreignLanguages?.map((e) => e.toJson()).toList(),
      'professionalSkills': professionalSkills?.map((e) => e.toJson()).toList(),
      'computerDriving': computerDriving,
      'computerSkills': computerSkills,
      'sectorPreferences': sectorPreferences,
      'employment': employment,
      'supportRequiredTrainingLearning': supportRequiredTrainingLearning,
      'supportRequiredEntrepreneurship': supportRequiredEntrepreneurship,
      'careerGuidanceCounselling': careerGuidanceCounselling,
      'generalNotes': generalNotes,
    };
  }
}


class Disabilities {
  String? nameDisability;
  String? rateDisability;

  Disabilities({
    this.nameDisability,
    this.rateDisability,
  });

  factory Disabilities.fromJson(Map<String, dynamic> json) {
    return Disabilities(
      nameDisability: json['nameDisbility'] ?? '',
      rateDisability: json['rateDisbility'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nameDisbility': nameDisability,
      'rateDisbility': rateDisability,
    };
  }
}


// class ThereIsDisbility {
//   String? nameDisbility;
//   String? rateDisbility;
//
//   ThereIsDisbility({this.nameDisbility, this.rateDisbility});
//
//   ThereIsDisbility.fromJson(Map<String, dynamic> json) {
//     nameDisbility = json['nameDisbility'];
//     rateDisbility = json['rateDisbility'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['nameDisbility'] = this.nameDisbility;
//     data['rateDisbility'] = this.rateDisbility;
//     return data;
//   }
// }
//
// class ThereIsDisbilityFamilyMember {
//   String? nameDisbility;
//   String? rateDisbility;
//
//   ThereIsDisbilityFamilyMember({this.nameDisbility, this.rateDisbility});
//
//   ThereIsDisbilityFamilyMember.fromJson(Map<String, dynamic> json) {
//     nameDisbility = json['nameDisbility'];
//     rateDisbility = json['rateDisbility'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['nameDisbility'] = this.nameDisbility;
//     data['rateDisbility'] = this.rateDisbility;
//     return data;
//   }
// }

class EducationalAttainments {
  String? educationalAttainmentLevel;
  String? specialization;
  String? certificate;
  String? graduationRate;
  String? academicYear;

  EducationalAttainments({
    this.educationalAttainmentLevel,
    this.specialization,
    this.certificate,
    this.graduationRate,
    this.academicYear,
  });

  factory EducationalAttainments.fromJson(Map<String, dynamic> json) {
    return EducationalAttainments(
      educationalAttainmentLevel: json['educationalAttainmentLevel'] ?? '',
      specialization: json['specialization'] ?? '',
      certificate: json['certificate'] ?? '',
      graduationRate: json['graduationRate'] ?? '',
      academicYear: json['academicYear'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'educationalAttainmentLevel': educationalAttainmentLevel,
      'specialization': specialization,
      'certificate': certificate,
      'graduationRate': graduationRate,
      'academicYear': academicYear,
    };
  }
}

class PreviousTrainingCourses {
  String? certificateAndType;
  String? executingAgency;
  String? dateExecute;

  PreviousTrainingCourses({
    this.certificateAndType,
    this.executingAgency,
    this.dateExecute,
  });

  factory PreviousTrainingCourses.fromJson(Map<String, dynamic> json) {
    return PreviousTrainingCourses(
      certificateAndType: json['certificateAndType'] ?? '',
      executingAgency: json['executingAgency'] ?? '',
      dateExecute: json['dateExecute'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'certificateAndType': certificateAndType,
      'executingAgency': executingAgency,
      'dateExecute': dateExecute,
    };
  }
}

class ForeignLanguages {
  String? nameLanguage;
  String? level;

  ForeignLanguages({
    this.nameLanguage,
    this.level,
  });

  factory ForeignLanguages.fromJson(Map<String, dynamic> json) {
    return ForeignLanguages(
      nameLanguage: json['namelanguage'] ?? '',
      level: json['level'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'namelanguage': nameLanguage,
      'level': level,
    };
  }
}

class ProfessionalSkills {
  String? jobTitle;
  String? start;
  String? end;
  String? jobTasks;

  ProfessionalSkills({this.jobTitle, this.start, this.end, this.jobTasks});

  factory ProfessionalSkills.fromJson(Map<String, dynamic> json) {
    return ProfessionalSkills(
      jobTitle: json['jobTitle'] ?? '',
      start: json['start'] ?? '',
      end: json['end'] ?? '',
      jobTasks: json['jobTasks'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobTitle': jobTitle,
      'start': start,
      'end': end,
      'jobTasks': jobTasks,
    };
  }
}


