import 'dart:convert';
import 'package:flutter/material.dart';

@immutable
class User {
  final int id;
  final int hospitalID;
  final int departmentID;
  final int role;
  final String email;
  final String countryCode;
  final String phoneNo;
  final String firstName;
  final String lastName;
  final String photo;
  final DateTime dob;
  final int gender;
  final String address;
  final String city;
  final String state;
  final int pinCode;
  final DateTime addedOn;
  final DateTime lastUpdated;
  final String token;
  final String imageURL;

  const User({
    required this.id,
    required this.hospitalID,
    required this.departmentID,
    required this.role,
    required this.email,
    required this.countryCode,
    required this.phoneNo,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.dob,
    required this.gender,
    required this.address,
    required this.city,
    required this.state,
    required this.pinCode,
    required this.addedOn,
    required this.lastUpdated,
    required this.token,
    required this.imageURL,
  });

  User copyWith({
    int? id,
    int? hospitalID,
    int? departmentID,
    int? role,
    String? email,
    String? countryCode,
    String? phoneNo,
    String? firstName,
    String? lastName,
    String? photo,
    DateTime? dob,
    int? gender,
    String? address,
    String? city,
    String? state,
    int? pinCode,
    DateTime? addedOn,
    DateTime? lastUpdated,
    String? token,
    String? imageURL,
  }) {
    return User(
      id: id ?? this.id,
      hospitalID: hospitalID ?? this.hospitalID,
      departmentID: departmentID ?? this.departmentID,
      role: role ?? this.role,
      email: email ?? this.email,
      countryCode: countryCode ?? this.countryCode,
      phoneNo: phoneNo ?? this.phoneNo,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      photo: photo ?? this.photo,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pinCode: pinCode ?? this.pinCode,
      addedOn: addedOn ?? this.addedOn,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      token: token ?? this.token,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'hospitalID': hospitalID,
      'departmentID': departmentID,
      'role': role,
      'email': email,
      'countryCode': countryCode,
      'phoneNo': phoneNo,
      'firstName': firstName,
      'lastName': lastName,
      'photo': photo,
      'dob': dob.millisecondsSinceEpoch,
      'gender': gender,
      'address': address,
      'city': city,
      'state': state,
      'pinCode': pinCode,
      'addedOn': addedOn.millisecondsSinceEpoch,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
      'token': token,
      'imageURL': imageURL,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      hospitalID: map['hospitalID'] as int,
      departmentID: map['departmentID'] as int,
      role: map['role'] as int,
      email: map['email'] as String,
      countryCode: map['countryCode'] as String,
      phoneNo: map['phoneNo'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      photo: map['photo'] as String,
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob'] as int),
      gender: map['gender'] as int,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      pinCode: map['pinCode'] as int,
      addedOn: DateTime.fromMillisecondsSinceEpoch(map['addedOn'] as int),
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'] as int),
      token: map['token'] as String,
      imageURL: map['imageURL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, hospitalID: $hospitalID, departmentID: $departmentID, role: $role, email: $email, countryCode: $countryCode, phoneNo: $phoneNo, firstName: $firstName, lastName: $lastName, photo: $photo, dob: $dob, gender: $gender, address: $address, city: $city, state: $state, pinCode: $pinCode, addedOn: $addedOn, lastUpdated: $lastUpdated, token: $token, imageURL: $imageURL)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.hospitalID == hospitalID &&
      other.departmentID == departmentID &&
      other.role == role &&
      other.email == email &&
      other.countryCode == countryCode &&
      other.phoneNo == phoneNo &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.photo == photo &&
      other.dob == dob &&
      other.gender == gender &&
      other.address == address &&
      other.city == city &&
      other.state == state &&
      other.pinCode == pinCode &&
      other.addedOn == addedOn &&
      other.lastUpdated == lastUpdated &&
      other.token == token &&
      other.imageURL == imageURL;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      hospitalID.hashCode ^
      departmentID.hashCode ^
      role.hashCode ^
      email.hashCode ^
      countryCode.hashCode ^
      phoneNo.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      photo.hashCode ^
      dob.hashCode ^
      gender.hashCode ^
      address.hashCode ^
      city.hashCode ^
      state.hashCode ^
      pinCode.hashCode ^
      addedOn.hashCode ^
      lastUpdated.hashCode ^
      token.hashCode ^
      imageURL.hashCode;
  }
}

