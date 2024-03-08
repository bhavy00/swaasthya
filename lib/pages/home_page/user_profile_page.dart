import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:swaasthya/widgets/forms/edit_user_form.dart';
import 'package:swaasthya/widgets/forms/reset_password_form.dart';

class UserProfilePage extends StatefulWidget {
  final User? userData;
  const UserProfilePage({super.key, this.userData});
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User\'s Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Information'),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        disabled = !disabled;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              EditUserForm(
                disabled: disabled,
                userData: widget.userData,
              ),
              const SizedBox(
                height: 15,
              ),
              const ResetPasswordPage()
            ],
          ),
        ),
      ),
    );
  }
}
