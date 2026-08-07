import 'package:flutter/material.dart';

class TextformfieldDay16 extends StatefulWidget {
  const TextformfieldDay16({super.key});

  @override
  State<TextformfieldDay16> createState() => _TextformfieldDay16State();
}

class _TextformfieldDay16State extends State<TextformfieldDay16> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,

      body: Form(
        child: Column(
          children: [
            TextField(
              controller: emailController,
              onChanged: (value) {
                setState(() {});
              },
            ),
            TextField(controller: emailController),
            TextField(controller: emailController),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email tidak boleh kosong";
                } else if (value.contains('@')) {
                  return "Email tidak valid";
                }
                return null;
              },
            ),
            TextFormField(controller: passwordController),
            TextFormField(controller: confirmPasswordController),
            Text(
              emailController.text,
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                print(emailController.text);
                print(passwordController.text);
                print(confirmPasswordController.text);
                if (_formKey.currentState!.validate()) {}
              },
              child: Text("Tekan ini"),
            ),
          ],
        ),
      ),
    );
  }
}
