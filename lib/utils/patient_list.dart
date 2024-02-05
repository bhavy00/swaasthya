final List<Map<String, dynamic>> patientList = [];
void fillPatient() {
  for (int i = 0; i < 10; i++) {
    patientList.add({
      'name': 'test patient $i',
      'dr_name': 'Dr. Vivek Arora',
      'date': '2024-25-01'
    });
  }
}

final List<Map<String, dynamic>> outPatientList = [];

void fillOutPatient() {
  for (int i = 0; i < 10; i++) {
    outPatientList.add({
      'name': 'test patient $i',
      'dischargeReason': 'Treatment Complete',
      'date': '2024-25-01'
    });
  }
}
