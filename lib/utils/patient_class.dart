class Patient {
  String name = '';
  String id = '';
  String uhid = '';
  double height = 0.0;
  double weight = 0.0;
  String gender = '';
  DateTime dob = DateTime.now();
  String photo = '';
  String email = '';
  int phoneNumber = 0;
  String address = '';
  String state = '';
  String city = '';
  int pincode = 0;
  String doctorName = '';
  String referredBy = '';
  String ward = 'General Ward';
  String category = 'Adult';
}

void printPatient(Patient data) {
  print({'name': data.name});
  print({'id': data.id});
  print({'uhid': data.uhid});
  print({'height': data.height});
  print({'weight': data.weight});
  print({'gender': data.gender});
  print({'dob': data.dob});
  print({'photo': data.photo});
  print({'email': data.email});
  print({'phoneNumber': data.phoneNumber});
  print({'address': data.address});
  print({'state': data.state});
  print({'city': data.city});
  print({'pincode': data.pincode});
  print({'doctorName': data.doctorName});
  print({'referredBy': data.referredBy});
}
