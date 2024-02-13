import 'package:flutter/material.dart';

class EditUserForm extends StatefulWidget {
  final bool disabled;
  const EditUserForm({super.key, required this.disabled});

  @override
  State<EditUserForm> createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  final _formKey = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = '';
  int _phoneNumber = 0;
  String _gender = '';
  DateTime _dob = DateTime.now();
  String _state = '';
  String _city = '';
  int _pincode = 0;
  String _email = '';
  String _homeAddress = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
              onSaved: (value) => _firstName = value!,
            ),
            TextFormField(
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
              onSaved: (value) => _lastName = value!,
            ),
            TextFormField(
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              onSaved: (value) => _phoneNumber = int.parse(value!),
            ),
            AbsorbPointer(
              absorbing: widget.disabled,
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            IgnorePointer(
              ignoring: widget.disabled,
              child: InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _dob = selectedDate;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                  ),
                  child: Text('${_dob.toLocal()}'.split(' ')[0]),
                ),
              ),
            ),
            TextFormField(
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'State'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your state';
                }
                return null;
              },
              onSaved: (value) => _state = value!,
            ),
            TextFormField(
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'City'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
              onSaved: (value) => _city = value!,
            ),
            TextFormField(
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Pincode'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your pincode';
                }
                return null;
              },
              onSaved: (value) => _pincode = int.parse(value!),
            ),
            TextFormField(
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
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              enabled: !widget.disabled,
              decoration: const InputDecoration(labelText: 'Home Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your home address';
                }
                return null;
              },
              onSaved: (value) => _homeAddress = value!,
            ),
            const SizedBox(height: 20),
            Center(
              child: IgnorePointer(
                ignoring: widget.disabled,
                child: ElevatedButton(
                  // style: ButtonStyle(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Process registration
                      // You can access form values here and submit them to a server or save locally
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
