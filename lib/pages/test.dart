final List<Map<String, dynamic>> patientList = [];

void test() {
  for (int i = 0; i < 10; i++) {
    patientList.add({
      'name': 'test patient $i',
      'dr_name': 'Dr. Vivek Arora',
      'date': '2024-25-01'
    });
  }
}
