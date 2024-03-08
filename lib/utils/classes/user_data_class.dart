// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class User {
  final int? id;
  final int? hospitalID;
  final int? departmentID;
  final int? role;
  final String? email;
  final String? countryCode;
  final String? phoneNo;
  final String? firstName;
  final String? lastName;
  final String? photo;
  final DateTime? dob;
  final int? gender;
  final String? address;
  final String? city;
  final String? state;
  final int? pinCode;
  final DateTime? addedOn;
  final DateTime? lastUpdated;
  final String? token;
  final String? imageURL;

  const User({
    this.id,
    this.hospitalID,
    this.departmentID,
    this.role,
    this.email,
    this.countryCode,
    this.phoneNo,
    this.firstName,
    this.lastName,
    this.photo,
    this.dob,
    this.gender,
    this.address,
    this.city,
    this.state,
    this.pinCode,
    this.addedOn,
    this.lastUpdated,
    this.token,
    this.imageURL,
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
      'dob': dob?.millisecondsSinceEpoch,
      'gender': gender,
      'address': address,
      'city': city,
      'state': state,
      'pinCode': pinCode,
      'addedOn': addedOn?.millisecondsSinceEpoch,
      'lastUpdated': lastUpdated?.millisecondsSinceEpoch,
      'token': token,
      'imageURL': imageURL,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      hospitalID: map['hospitalID'] != null ? map['hospitalID'] as int : null,
      departmentID:
          map['departmentID'] != null ? map['departmentID'] as int : null,
      role: map['role'] != null ? map['role'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      countryCode:
          map['countryCode'] != null ? map['countryCode'] as String : null,
      phoneNo: map['phoneNo'] != null ? map['phoneNo'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      dob: map['dob'] != null ? DateTime.parse(map['dob']) : null,
      gender: map['gender'] != null ? map['gender'] as int : null,
      address: map['address'] != null ? map['address'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      pinCode: map['pinCode'] != null ? map['pinCode'] as int : null,
      addedOn: map['addedOn'] != null ? DateTime.parse(map['addedOn']) : null,
      lastUpdated: map['lastUpdated'] != null
          ? DateTime.parse(map['lastUpdated'])
          : null,
      token: map['token'] != null ? map['token'] as String : null,
      imageURL: map['imageURL'] != null ? map['imageURL'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, hospitalID: $hospitalID, departmentID: $departmentID, role: $role, email: $email, countryCode: $countryCode, phoneNo: $phoneNo, firstName: $firstName, lastName: $lastName, photo: $photo, dob: $dob, gender: $gender, address: $address, city: $city, state: $state, pinCode: $pinCode, addedOn: $addedOn, lastUpdated: $lastUpdated, token: $token, imageURL: $imageURL)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
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
