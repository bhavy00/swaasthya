Map<String, int> reportType = {
  'Radiology': 1,
  'Pathology': 2,
  'Previous History': 3,
};

Map<String, int> medicineCategory = {
  'Capsules': 1,
  'Syrups': 2,
  'Tablets': 3,
  'Injections': 4,
  'Iv Line': 5,
};

Map<int, String> medicineCategoryByNo = {
  1: 'Capsules',
  2: 'Syrups',
  3: 'Tablets',
  4: 'Injections',
  5: 'Iv Line',
};

Map<int, String> dischargeReasonByNo = {
  1: 'Success',
  2: 'DOPR',
  3: 'Abscond',
  4: 'Left',
  5: 'Death',
};

Map<String, int> dischargeType = {
  'Discharge Success': 1,
  'DOPR': 2,
  'Absconded': 3,
  'Left against medical advice': 4,
  'Death': 5
};

Map<String, int> transferType = {
    'Internal': 1,
  'External': 2,
  'Emergency': 3,
  'Non-Emergency': 4,
};
