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
  String phoneNumber = '';
  String address = '';
  String state = '';
  String city = '';
  String pincode = '';
  String doctorName = '';
  String referredBy = '';
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
