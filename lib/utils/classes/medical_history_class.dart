// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MedicalHistory {
  String givenName;
  String givenPhone;
  String givenRelation;
  String bloodGroup;
  bool highBp;
  bool lowBp;
  bool diabetes;
  bool surgery;
  bool lipidameia;
  bool foodAllergy;
  bool medicineAllergy;
  bool anesthesiaAllergy;
  bool prescribedMedicine;
  bool selfPrescribedMedicine;
  bool heart;
  bool mental;
  bool chest;
  bool epilepsy;
  bool bone;
  bool hiv;
  bool hepatitisB;
  bool hepatitisC;
  bool alcohol;
  bool tobacco;
  bool drugs;
  bool geneticDiseases;
  bool pregnant;
  bool lumps;
  bool cancer;
  String medicineAllergyList;
  String foodAllergyList;
  String geneticDiseasesList;
  String selfMedicineList;
  String prescribedMedicineList;
  String chestCondition;
  String heartDiseases;
  String mentalHealth;
  String neurologicalDisorder;

  MedicalHistory(
      {this.givenName = '',
      this.givenPhone = '',
      this.givenRelation = '',
      this.bloodGroup = 'A+',
      this.highBp = false,
      this.lowBp = false,
      this.diabetes = false,
      this.surgery = false,
      this.lipidameia = false,
      this.foodAllergy = false,
      this.medicineAllergy = false,
      this.anesthesiaAllergy = false,
      this.prescribedMedicine = false,
      this.selfPrescribedMedicine = false,
      this.heart = false,
      this.mental = false,
      this.chest = false,
      this.epilepsy = false,
      this.bone = false,
      this.hiv = false,
      this.hepatitisB = false,
      this.hepatitisC = false,
      this.alcohol = false,
      this.tobacco = false,
      this.drugs = false,
      this.geneticDiseases = false,
      this.pregnant = false,
      this.lumps = false,
      this.cancer = false,
      this.medicineAllergyList = '',
      this.foodAllergyList = '',
      this.geneticDiseasesList = '',
      this.selfMedicineList = '',
      this.prescribedMedicineList = '',
      this.chestCondition = '',
      this.heartDiseases = '',
      this.mentalHealth = '',
      this.neurologicalDisorder = ''});

  void printAllValues() {
    print('Name: $givenName');
    print('Phone Number: $givenPhone');
    print('Relationship: $givenRelation');
    print('Blood Group: $bloodGroup');
    print('High BP: $highBp');
    print('Low BP: $lowBp');
    print('Diabetes: $diabetes');
    print('Surgery: $surgery');
    print('Lipidameia: $lipidameia');
    print('Food Allergy: $foodAllergy');
    print('Medicine Allergy: $medicineAllergy');
    print('Anesthesia Allergy: $anesthesiaAllergy');
    print('Prescribed Medicine: $prescribedMedicine');
    print('Self-Prescribed Medicine: $selfPrescribedMedicine');
    print('Heart: $heart');
    print('Mental: $mental');
    print('Chest: $chest');
    print('Epilepsy: $epilepsy');
    print('Bone: $bone');
    print('HIV: $hiv');
    print('Hepatitis B: $hepatitisB');
    print('Hepatitis C: $hepatitisC');
    print('Alcohol: $alcohol');
    print('Tobacco: $tobacco');
    print('Drugs: $drugs');
    print('Genetic Diseases: $geneticDiseases');
    print('Pregnant: $pregnant');
    print('Lumps: $lumps');
    print('Cancer: $cancer');
    print('medicine allergy list: $medicineAllergyList');
    print('food allergy list: $foodAllergyList');
    print('genetic diseases list: $geneticDiseasesList');
    print('self medicine list: $selfMedicineList');
    print('prescribed medicine list: $prescribedMedicineList');
  }
  // factory MedicalHistory.fromMap(Map<String, dynamic> map) {
  //   return MedicalHistory(
  //     givenName: map['givenName'] as String,
  //     givenPhone: map['givenPhone'] as String,
  //     givenRelation: map['givenRelation'] as String,
  //     bloodGroup: map['bloodGroup'] as String,
  //     highBp: map['highBp'] as bool,
  //     lowBp: map['lowBp'] as bool,
  //     diabetes: map['diabetes'] as bool,
  //     surgery: map['surgery'] as bool,
  //     lipidameia: map['lipidameia'] as bool,
  //     foodAllergy: map['foodAllergy'].length != 0,
  //     medicineAllergy: map['medicineAllergy'].length != 0,
  //     anesthesiaAllergy:
  //         map['anesthesia'].toString().trim().toLowerCase() == 'yes',
  //     prescribedMedicine: map['prescribedMedicine'] as bool,
  //     selfPrescribedMedicine: map['selfMeds'].length != 0,
  //     heart: map['heartProblems'].length != 0,
  //     mental: map['mentalHealth'].length != 0,
  //     chest: map['chestCondition'].length != 0,
  //     epilepsy: map['epilepsy'] as bool,
  //     bone: map['bone'] as bool,
  //     hiv: map['hiv'] as bool,
  //     hepatitisB: map['hepatitisB'] as bool,
  //     hepatitisC: map['hepatitisC'] as bool,
  //     alcohol: map['alcohol'] as bool,
  //     tobacco: map['tobacco'] as bool,
  //     drugs: map['drugs'].toString().trim().toLowerCase() == 'yes',
  //     geneticDiseases: map['geneticDiseases'] as bool,
  //     pregnant: map['pregnant'].toString().trim().toLowerCase() == 'yes',
  //     lumps: map['lumps'].toString().trim().toLowerCase() == 'yes',
  //     cancer: map['cancer'].toString().trim().toLowerCase() == 'yes',
  //     medicineAllergyList: map['medicineAllergy'] as String,
  //     foodAllergyList: map['foodAllergy'] as String,
  //     geneticDiseasesList: map['geneticDiseasesList'] as String,
  //     selfMedicineList: map['selfMedicineList'] as String,
  //     prescribedMedicineList: map['prescribedMedicineList'] as String,
  //   );
  // }

  MedicalHistory copyWith({
    String? givenName,
    String? givenPhone,
    String? givenRelation,
    String? bloodGroup,
    bool? highBp,
    bool? lowBp,
    bool? diabetes,
    bool? surgery,
    bool? lipidameia,
    bool? foodAllergy,
    bool? medicineAllergy,
    bool? anesthesiaAllergy,
    bool? prescribedMedicine,
    bool? selfPrescribedMedicine,
    bool? heart,
    bool? mental,
    bool? chest,
    bool? epilepsy,
    bool? bone,
    bool? hiv,
    bool? hepatitisB,
    bool? hepatitisC,
    bool? alcohol,
    bool? tobacco,
    bool? drugs,
    bool? geneticDiseases,
    bool? pregnant,
    bool? lumps,
    bool? cancer,
    String? medicineAllergyList,
    String? foodAllergyList,
    String? geneticDiseasesList,
    String? selfMedicineList,
    String? prescribedMedicineList,
    String? chestCondition,
    String? heartDiseases,
    String? mentalHealth,
    String? neurologicalDisorder,
  }) {
    return MedicalHistory(
      givenName: givenName ?? this.givenName,
      givenPhone: givenPhone ?? this.givenPhone,
      givenRelation: givenRelation ?? this.givenRelation,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      highBp: highBp ?? this.highBp,
      lowBp: lowBp ?? this.lowBp,
      diabetes: diabetes ?? this.diabetes,
      surgery: surgery ?? this.surgery,
      lipidameia: lipidameia ?? this.lipidameia,
      foodAllergy: foodAllergy ?? this.foodAllergy,
      medicineAllergy: medicineAllergy ?? this.medicineAllergy,
      anesthesiaAllergy: anesthesiaAllergy ?? this.anesthesiaAllergy,
      prescribedMedicine: prescribedMedicine ?? this.prescribedMedicine,
      selfPrescribedMedicine:
          selfPrescribedMedicine ?? this.selfPrescribedMedicine,
      heart: heart ?? this.heart,
      mental: mental ?? this.mental,
      chest: chest ?? this.chest,
      epilepsy: epilepsy ?? this.epilepsy,
      bone: bone ?? this.bone,
      hiv: hiv ?? this.hiv,
      hepatitisB: hepatitisB ?? this.hepatitisB,
      hepatitisC: hepatitisC ?? this.hepatitisC,
      alcohol: alcohol ?? this.alcohol,
      tobacco: tobacco ?? this.tobacco,
      drugs: drugs ?? this.drugs,
      geneticDiseases: geneticDiseases ?? this.geneticDiseases,
      pregnant: pregnant ?? this.pregnant,
      lumps: lumps ?? this.lumps,
      cancer: cancer ?? this.cancer,
      medicineAllergyList: medicineAllergyList ?? this.medicineAllergyList,
      foodAllergyList: foodAllergyList ?? this.foodAllergyList,
      geneticDiseasesList: geneticDiseasesList ?? this.geneticDiseasesList,
      selfMedicineList: selfMedicineList ?? this.selfMedicineList,
      prescribedMedicineList:
          prescribedMedicineList ?? this.prescribedMedicineList,
      chestCondition: chestCondition ?? this.chestCondition,
      heartDiseases: heartDiseases ?? this.heartDiseases,
      mentalHealth: mentalHealth ?? this.mentalHealth,
      neurologicalDisorder: neurologicalDisorder ?? this.neurologicalDisorder,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'givenName': givenName,
      'givenPhone': givenPhone,
      'givenRelation': givenRelation,
      'bloodGroup': bloodGroup,
      'highBp': highBp,
      'lowBp': lowBp,
      'diabetes': diabetes,
      'surgery': surgery,
      'lipidameia': lipidameia,
      'foodAllergy': foodAllergy,
      'medicineAllergy': medicineAllergy,
      'anesthesiaAllergy': anesthesiaAllergy,
      'prescribedMedicine': prescribedMedicine,
      'selfPrescribedMedicine': selfPrescribedMedicine,
      'heart': heart,
      'mental': mental,
      'chest': chest,
      'epilepsy': epilepsy,
      'bone': bone,
      'hiv': hiv,
      'hepatitisB': hepatitisB,
      'hepatitisC': hepatitisC,
      'alcohol': alcohol,
      'tobacco': tobacco,
      'drugs': drugs,
      'geneticDiseases': geneticDiseases,
      'pregnant': pregnant,
      'lumps': lumps,
      'cancer': cancer,
      'medicineAllergyList': medicineAllergyList,
      'foodAllergyList': foodAllergyList,
      'geneticDiseasesList': geneticDiseasesList,
      'selfMedicineList': selfMedicineList,
      'prescribedMedicineList': prescribedMedicineList,
      'chestCondition': chestCondition,
      'heartDiseases': heartDiseases,
      'mentalHealth': mentalHealth,
      'neurologicalDisorder': neurologicalDisorder,
    };
  }

  factory MedicalHistory.fromMap(Map<String, dynamic> map) {
    List<dynamic> disease = map['disease'] != null
        ? map['disease'].split(',').map((e) => e.trim().toLowerCase()).toList()
        : [];
    List<dynamic> infections = map['infections'] != null
        ? map['infections']
            .split(',')
            .map((e) => e.trim().toLowerCase())
            .toList()
        : [];
    List<dynamic> drugs = map['drugs'] != null
        ? map['drugs'].split(',').map((e) => e.trim().toLowerCase()).toList()
        : [];
    //print(map);
    return MedicalHistory(
      givenName: map['givenName'] != null ? map['givenName'] as String : '',
      givenPhone: map['givenPhone'] != null ? map['givenPhone'] as String : '',
      givenRelation:
          map['givenRelation'] != null ? map['givenRelation'] as String : '',
      bloodGroup: map['bloodGroup'] != null ? map['bloodGroup'] as String : '',
      highBp: map['highBp'] != null ? map['highBp'] as bool : false,
      lowBp: map['lowBp'] != null ? map['lowBp'] as bool : false,
      diabetes: disease.isNotEmpty ? disease.contains('diabetes') : false,
      surgery: disease.isNotEmpty
          ? disease.contains('been through any surgery')
          : false,
      lipidameia: disease.isNotEmpty
          ? disease.contains('hyper lipidaemia / dyslipidaemia')
          : false,
      foodAllergy: map['foodAllergy'] != null && map['foodAllergy'].isNotEmpty,
      medicineAllergy:
          map['medicineAllergy'] != null && map['medicineAllergy'].isNotEmpty,
      anesthesiaAllergy: map['anesthesia'] != null
          ? map['anesthesia'].toString().trim().toLowerCase() == 'yes'
          : false,
      prescribedMedicine: map['meds'] != null && map['meds'].isNotEmpty,
      selfPrescribedMedicine:
          map['selfMeds'] != null && map['selfMeds'].isNotEmpty,
      heart: map['heartProblems'] != null && map['heartProblems'].isNotEmpty,
      mental: map['mentalHealth'] != null && map['mentalHealth'].isNotEmpty,
      chest: map['chestCondition'] != null && map['chestCondition'].isNotEmpty,
      epilepsy: disease.isNotEmpty ? disease.contains('epilepsy') : false,
      bone: disease.isNotEmpty ? disease.contains('bone/joint') : false,
      hiv: infections.isNotEmpty ? infections.contains('hiv') : false,
      hepatitisB:
          infections.isNotEmpty ? infections.contains('hepatitis b') : false,
      hepatitisC:
          infections.isNotEmpty ? infections.contains('hepatitis c') : false,
      alcohol: drugs.isNotEmpty ? drugs.contains('alcohol') : false,
      tobacco: drugs.isNotEmpty ? drugs.contains('tobacco') : false,
      drugs: drugs.isNotEmpty ? drugs.contains('drugs') : false,
      geneticDiseases: map['hereditaryDisease'] != null &&
          map['hereditaryDisease'].isNotEmpty,
      pregnant: map['pregnant'] != null
          ? map['pregnant'].toString().trim().toLowerCase() == 'yes'
          : false,
      lumps: map['lumps'] != null
          ? map['lumps'].toString().trim().toLowerCase() == 'yes'
          : false,
      cancer: map['cancer'] != null
          ? map['cancer'].toString().trim().toLowerCase() == 'yes'
          : false,
      medicineAllergyList: map['medicineAllergy'] != null
          ? map['medicineAllergy'] as String
          : '',
      foodAllergyList:
          map['foodAllergy'] != null ? map['foodAllergy'] as String : '',
      geneticDiseasesList: map['hereditaryDisease'] != null
          ? map['hereditaryDisease'] as String
          : '',
      selfMedicineList:
          map['selfMeds'] != null ? map['selfMeds'] as String : '',
      prescribedMedicineList: map['meds'] != null ? map['meds'] as String : '',
      chestCondition:
          map['chestCondition'] != null ? map['chestCondition'] as String : '',
      heartDiseases:
          map['heartProblems'] != null ? map['heartProblems'] as String : '',
      mentalHealth:
          map['mentalHealth'] != null ? map['mentalHealth'] as String : '',
      neurologicalDisorder: map['neurologicalDisorder'] != null
          ? map['neurologicalDisorder'] as String
          : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalHistory.fromJson(String source) =>
      MedicalHistory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MedicalHistory(givenName: $givenName, givenPhone: $givenPhone, givenRelation: $givenRelation, bloodGroup: $bloodGroup, highBp: $highBp, lowBp: $lowBp, diabetes: $diabetes, surgery: $surgery, lipidameia: $lipidameia, foodAllergy: $foodAllergy, medicineAllergy: $medicineAllergy, anesthesiaAllergy: $anesthesiaAllergy, prescribedMedicine: $prescribedMedicine, selfPrescribedMedicine: $selfPrescribedMedicine, heart: $heart, mental: $mental, chest: $chest, epilepsy: $epilepsy, bone: $bone, hiv: $hiv, hepatitisB: $hepatitisB, hepatitisC: $hepatitisC, alcohol: $alcohol, tobacco: $tobacco, drugs: $drugs, geneticDiseases: $geneticDiseases, pregnant: $pregnant, lumps: $lumps, cancer: $cancer, medicineAllergyList: $medicineAllergyList, foodAllergyList: $foodAllergyList, geneticDiseasesList: $geneticDiseasesList, selfMedicineList: $selfMedicineList, prescribedMedicineList: $prescribedMedicineList, chestCondition: $chestCondition, heartDiseases: $heartDiseases, mentalHealth: $mentalHealth, neurologicalDisorder: $neurologicalDisorder)';
  }

  @override
  bool operator ==(covariant MedicalHistory other) {
    if (identical(this, other)) return true;

    return other.givenName == givenName &&
        other.givenPhone == givenPhone &&
        other.givenRelation == givenRelation &&
        other.bloodGroup == bloodGroup &&
        other.highBp == highBp &&
        other.lowBp == lowBp &&
        other.diabetes == diabetes &&
        other.surgery == surgery &&
        other.lipidameia == lipidameia &&
        other.foodAllergy == foodAllergy &&
        other.medicineAllergy == medicineAllergy &&
        other.anesthesiaAllergy == anesthesiaAllergy &&
        other.prescribedMedicine == prescribedMedicine &&
        other.selfPrescribedMedicine == selfPrescribedMedicine &&
        other.heart == heart &&
        other.mental == mental &&
        other.chest == chest &&
        other.epilepsy == epilepsy &&
        other.bone == bone &&
        other.hiv == hiv &&
        other.hepatitisB == hepatitisB &&
        other.hepatitisC == hepatitisC &&
        other.alcohol == alcohol &&
        other.tobacco == tobacco &&
        other.drugs == drugs &&
        other.geneticDiseases == geneticDiseases &&
        other.pregnant == pregnant &&
        other.lumps == lumps &&
        other.cancer == cancer &&
        other.medicineAllergyList == medicineAllergyList &&
        other.foodAllergyList == foodAllergyList &&
        other.geneticDiseasesList == geneticDiseasesList &&
        other.selfMedicineList == selfMedicineList &&
        other.prescribedMedicineList == prescribedMedicineList &&
        other.chestCondition == chestCondition &&
        other.heartDiseases == heartDiseases &&
        other.mentalHealth == mentalHealth &&
        other.neurologicalDisorder == neurologicalDisorder;
  }

  @override
  int get hashCode {
    return givenName.hashCode ^
        givenPhone.hashCode ^
        givenRelation.hashCode ^
        bloodGroup.hashCode ^
        highBp.hashCode ^
        lowBp.hashCode ^
        diabetes.hashCode ^
        surgery.hashCode ^
        lipidameia.hashCode ^
        foodAllergy.hashCode ^
        medicineAllergy.hashCode ^
        anesthesiaAllergy.hashCode ^
        prescribedMedicine.hashCode ^
        selfPrescribedMedicine.hashCode ^
        heart.hashCode ^
        mental.hashCode ^
        chest.hashCode ^
        epilepsy.hashCode ^
        bone.hashCode ^
        hiv.hashCode ^
        hepatitisB.hashCode ^
        hepatitisC.hashCode ^
        alcohol.hashCode ^
        tobacco.hashCode ^
        drugs.hashCode ^
        geneticDiseases.hashCode ^
        pregnant.hashCode ^
        lumps.hashCode ^
        cancer.hashCode ^
        medicineAllergyList.hashCode ^
        foodAllergyList.hashCode ^
        geneticDiseasesList.hashCode ^
        selfMedicineList.hashCode ^
        prescribedMedicineList.hashCode ^
        chestCondition.hashCode ^
        heartDiseases.hashCode ^
        mentalHealth.hashCode ^
        neurologicalDisorder.hashCode;
  }
}
