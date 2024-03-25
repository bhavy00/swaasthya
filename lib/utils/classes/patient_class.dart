// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Patient {
  String? pName = '';
  int? userID = 2;
  String? pID = '1';
  int? uhid = 1;
  int? ptype = 2;
  int? departmentID = 1;
  int? hospitalID = 1;
  double? height = 0.0;
  double? weight = 0.0;
  int gender = 1;
  DateTime? dob = DateTime.now();
  String? photo = '';
  String? email = '';
  String? phoneNumber = '';
  String? address = '';
  String? state = '';
  String? city = '';
  String? pincode = '';
  String? doctorName = '';
  String? referredBy = '';
  int wardID = 1;
  int category = 3;
  int insurance = 0;
  String? insuranceNumber = '';
  String? insuranceCompany = '';

  Patient({
    this.pName,
    this.userID,
    this.pID,
    this.uhid,
    this.ptype,
    this.departmentID,
    this.hospitalID,
    this.height,
    this.weight,
    this.gender = 1,
    this.photo,
    this.email,
    this.phoneNumber,
    this.address,
    this.state,
    this.city,
    this.pincode,
    this.doctorName,
    this.referredBy,
    this.wardID = 1,
    this.category = 3,
    this.insurance = 0,
    this.insuranceNumber,
    this.insuranceCompany,
  });

  Patient copyWith({
    String? pName,
    int? userID,
    String? pID,
    int? uhid,
    int? ptype,
    int? departmentID,
    int? hospitalID,
    double? height,
    double? weight,
    int? gender,
    String? photo,
    String? email,
    String? phoneNumber,
    String? address,
    String? state,
    String? city,
    String? pincode,
    String? doctorName,
    String? referredBy,
    int? wardID,
    int? category,
    int? insurance,
    String? insuranceNumber,
    String? insuranceCompany,
  }) {
    return Patient(
      pName: pName ?? this.pName,
      userID: userID ?? this.userID,
      pID: pID ?? this.pID,
      uhid: uhid ?? this.uhid,
      ptype: ptype ?? this.ptype,
      departmentID: departmentID ?? this.departmentID,
      hospitalID: hospitalID ?? this.hospitalID,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      photo: photo ?? this.photo,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      state: state ?? this.state,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      doctorName: doctorName ?? this.doctorName,
      referredBy: referredBy ?? this.referredBy,
      wardID: wardID ?? this.wardID,
      category: category ?? this.category,
      insurance: insurance ?? this.insurance,
      insuranceNumber: insuranceNumber ?? this.insuranceNumber,
      insuranceCompany: insuranceCompany ?? this.insuranceCompany,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pName': pName,
      'userID': userID,
      'pID': pID,
      'uhid': uhid,
      'ptype': ptype,
      'departmentID': departmentID,
      'hospitalID': hospitalID,
      'height': height,
      'weight': weight,
      'gender': gender,
      'photo': photo,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'state': state,
      'city': city,
      'pincode': pincode,
      'doctorName': doctorName,
      'referredBy': referredBy,
      'wardID': wardID,
      'category': category,
      'insurance': insurance,
      'insuranceNumber': insuranceNumber,
      'insuranceCompany': insuranceCompany,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      pName: map['pName'] != null ? map['pName'] as String : null,
      userID: map['userID'] != null ? map['userID'] as int : null,
      pID: map['pID'] != null ? map['pID'] as String : null,
      uhid: map['uhid'] != null ? map['uhid'] as int : null,
      ptype: map['ptype'] != null ? map['ptype'] as int : null,
      departmentID:
          map['departmentID'] != null ? map['departmentID'] as int : null,
      hospitalID: map['hospitalID'] != null ? map['hospitalID'] as int : null,
      height: map['height'] != null ? map['height'] as double : null,
      weight: map['weight'] != null ? map['weight'] as double : null,
      gender: map['gender'] as int,
      photo: map['photo'] != null ? map['photo'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as String : null,
      doctorName:
          map['doctorName'] != null ? map['doctorName'] as String : null,
      referredBy:
          map['referredBy'] != null ? map['referredBy'] as String : null,
      wardID: map['wardID'] as int,
      category: map['category'] as int,
      insurance: map['insurance'] as int,
      insuranceNumber: map['insuranceNumber'] != null
          ? map['insuranceNumber'] as String
          : null,
      insuranceCompany: map['insuranceCompany'] != null
          ? map['insuranceCompany'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Patient(pName: $pName, userID: $userID, pID: $pID, uhid: $uhid, ptype: $ptype, departmentID: $departmentID, hospitalID: $hospitalID, height: $height, weight: $weight, gender: $gender, photo: $photo, email: $email, phoneNumber: $phoneNumber, address: $address, state: $state, city: $city, pincode: $pincode, doctorName: $doctorName, referredBy: $referredBy, wardID: $wardID, category: $category, insurance: $insurance, insuranceNumber: $insuranceNumber, insuranceCompany: $insuranceCompany)';
  }

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;

    return other.pName == pName &&
        other.userID == userID &&
        other.pID == pID &&
        other.uhid == uhid &&
        other.ptype == ptype &&
        other.departmentID == departmentID &&
        other.hospitalID == hospitalID &&
        other.height == height &&
        other.weight == weight &&
        other.gender == gender &&
        other.photo == photo &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.state == state &&
        other.city == city &&
        other.pincode == pincode &&
        other.doctorName == doctorName &&
        other.referredBy == referredBy &&
        other.wardID == wardID &&
        other.category == category &&
        other.insurance == insurance &&
        other.insuranceNumber == insuranceNumber &&
        other.insuranceCompany == insuranceCompany;
  }

  @override
  int get hashCode {
    return pName.hashCode ^
        userID.hashCode ^
        pID.hashCode ^
        uhid.hashCode ^
        ptype.hashCode ^
        departmentID.hashCode ^
        hospitalID.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        gender.hashCode ^
        photo.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        state.hashCode ^
        city.hashCode ^
        pincode.hashCode ^
        doctorName.hashCode ^
        referredBy.hashCode ^
        wardID.hashCode ^
        category.hashCode ^
        insurance.hashCode ^
        insuranceNumber.hashCode ^
        insuranceCompany.hashCode;
  }
}

void printPatient(Patient data) {
  print({'pName': data.pName});
  print({'id': data.userID});
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

Map<String, int> pCategory = {
  'Adult': 3,
  'Neonate': 1,
  'Child': 2,
};
