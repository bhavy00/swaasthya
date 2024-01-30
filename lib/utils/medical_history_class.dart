class MedicalHistory {
  String name;
  String phoneNumber;
  String relationship;
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

  MedicalHistory({
    this.name = '',
    this.phoneNumber = '',
    this.relationship = '',
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
  });

  void printAllValues() {
    print('Name: $name');
    print('Phone Number: $phoneNumber');
    print('Relationship: $relationship');
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
  }
}
