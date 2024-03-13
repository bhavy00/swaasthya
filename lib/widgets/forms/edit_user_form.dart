import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';

class EditUserForm extends StatefulWidget {
  final bool disabled;
  final User? userData;
  const EditUserForm({this.userData, super.key, required this.disabled});

  @override
  State<EditUserForm> createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // print(userData);
    int? _gender = widget.userData?.gender;
    DateTime? dob = widget.userData?.dob;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller:
                  TextEditingController(text: widget.userData?.firstName),
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
              // onSaved: (value) => _firstName = value!,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller:
                  TextEditingController(text: widget.userData?.lastName),
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
              // onSaved: (value) => _lastName = value!,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: TextEditingController(text: widget.userData?.phoneNo),
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              // onSaved: (value) => _phoneNumber = int.parse(value!),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Gender'),
              value: _gender == 1 ? 'Male' : 'Female',
              items: ['Male', 'Female']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: widget.disabled
                  ? null
                  : (value) {
                      setState(() {});
                    },
              validator: (value) {
                if (value == null) {
                  return 'Please select your gender';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: widget.disabled
                  ? null
                  : () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          dob = selectedDate;
                        });
                      }
                    },
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                ),
                child: Text('${dob?.toLocal()}'.split(' ')[0]),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: TextEditingController(text: widget.userData?.state),
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'State'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your state';
                }
                return null;
              },
              // onSaved: (value) => _state = value!,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: TextEditingController(text: widget.userData?.city),
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'City'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
              // onSaved: (value) => _city = value!,
            ),
            const SizedBox(height: 20),
            TextFormField(
              // controller: TextEditingController(text: widget.userData?.pinCode as String?),
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Pincode'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your pincode';
                }
                return null;
              },
              // onSaved: (value) => _pincode = int.parse(value!),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: TextEditingController(text: widget.userData?.email),
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                // You can add more complex email validation logic here if needed
                return null;
              },
              // onSaved: (value) => _email = value!,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: TextEditingController(text: widget.userData?.address),
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Home Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your home address';
                }
                return null;
              },
              // onSaved: (value) => _homeAddress = value!,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: widget.disabled
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Process registration
                          // You can access form values here and submit them to a server or save locally
                        }
                      },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
