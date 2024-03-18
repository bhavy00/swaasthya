// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  
  Patient({
    required this.name,
    required this.id,
    required this.uhid,
    required this.height,
    required this.weight,
    required this.gender,
    required this.photo,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.state,
    required this.city,
    required this.pincode,
    required this.doctorName,
    required this.referredBy,
    required this.ward,
    required this.category,
  });

  Patient copyWith({
    String? name,
    String? id,
    String? uhid,
    double? height,
    double? weight,
    String? gender,
    String? photo,
    String? email,
    int? phoneNumber,
    String? address,
    String? state,
    String? city,
    int? pincode,
    String? doctorName,
    String? referredBy,
    String? ward,
    String? category,
  }) {
    return Patient(
      name: name ?? this.name,
      id: id ?? this.id,
      uhid: uhid ?? this.uhid,
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
      ward: ward ?? this.ward,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'uhid': uhid,
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
      'ward': ward,
      'category': category,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      name: map['name'] as String,
      id: map['id'] as String,
      uhid: map['uhid'] as String,
      height: map['height'] as double,
      weight: map['weight'] as double,
      gender: map['gender'] as String,
      photo: map['photo'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as int,
      address: map['address'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      pincode: map['pincode'] as int,
      doctorName: map['doctorName'] as String,
      referredBy: map['referredBy'] as String,
      ward: map['ward'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) => Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Patient(name: $name, id: $id, uhid: $uhid, height: $height, weight: $weight, gender: $gender, photo: $photo, email: $email, phoneNumber: $phoneNumber, address: $address, state: $state, city: $city, pincode: $pincode, doctorName: $doctorName, referredBy: $referredBy, ward: $ward, category: $category)';
  }

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.id == id &&
      other.uhid == uhid &&
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
      other.ward == ward &&
      other.category == category;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      id.hashCode ^
      uhid.hashCode ^
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
      ward.hashCode ^
      category.hashCode;
  }
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
