import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day_13/Drawe.dart';

class Tugas10Day16 extends StatefulWidget {
  const Tugas10Day16({super.key});

  @override
  State<Tugas10Day16> createState() => _Tugas10Day16State();
}

class _Tugas10Day16State extends State<Tugas10Day16> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: const Color.fromARGB(255, 202, 201, 201),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Welcome back to Estero. Have a good time",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 104, 103, 103),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  // height: 170,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 1.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email tidak boleh kosong";
                            } else if (value.contains('@')) {
                              return "Email tidak valid";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Your Email/id",
                            hintStyle: TextStyle(fontSize: 17),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 0,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value.contains('@')) {
                              return "Password tidak valid";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Your Password",
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: AlignmentGeometry.topStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                    if (_formKey.currentState!.validate()) {}
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) => DrawerDay13())),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 125, 34, 199),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: Align(
                      alignment: AlignmentGeometry.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: const Color.fromARGB(255, 17, 14, 14),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text("Or continue with"),
                      SizedBox(width: 15),
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: const Color.fromARGB(255, 17, 14, 14),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/flat-color-icons_google.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                          image: AssetImage("assets/cib_apple.png"),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                          image: AssetImage("assets/Frame 1.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(255, 1, 18, 167),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
