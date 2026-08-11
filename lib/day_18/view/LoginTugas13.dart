import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day_13/Drawe.dart';
import 'package:flutter_application_1alfin/day_18/database/db_helper.dart';
import 'package:flutter_application_1alfin/day_18/model/user_login13.dart';
import 'package:flutter_application_1alfin/extensinon/navigator.dart';

// Halaman Login Day 17 (StatefulWidget untuk mengelola controller input teks dan interaksi user).
class LoginDay18SQFLITE extends StatefulWidget {
  const LoginDay18SQFLITE({super.key});

  @override
  State<LoginDay18SQFLITE> createState() => _LoginDay18SQFLITEState();
}

class _LoginDay18SQFLITEState extends State<LoginDay18SQFLITE> {
  // Controller untuk membaca dan mengontrol isi field input email.
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void register() async {
    final user = emailC.text.trim();
    final pass = passwordC.text;
    final noHp = noHpController.text;
    final kota = kotaController.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = UseMoodelSQL(
      email: user,
      password: pass,
      noHp: noHp,
      kota: kota,
    );

    bool success = await DBHelper().registerUser(pengguna);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
    }
  }

  void login() async {
    final user = emailC.text.trim();
    final pass = passwordC.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = await DBHelper().loginUser(user, pass);

    if (!mounted) return;

    if (pengguna != null) {
      context.pushAndRemoveAll(DrawerDay13());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal! email atau Password salah.'),
        ), // SnackBar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Warna latar belakang utama (Dark Blue) & warna tombol sosial media.
    const primaryBgColor = Color.fromARGB(255, 52, 53, 54);
    const socialBtnColor = Color.fromARGB(255, 149, 187, 238);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 122, 232),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            // Aksi tombol kembali (jika diperlukan)
          },
        ),
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Judul & Sub-judul halaman login
                const Text(
                  'Welcome Back to LocalMart',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 29, 28, 28),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome Back Please Sign in Again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 10, 10),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 40),

                // Input Email
                TextFormField(
                  validator: (value) {
                    // Aturan validasi email:
                    // 1. Tidak boleh kosong.
                    // 2. Harus mengandung karakter '@'.
                    // 3. Harus diakhiri/mengandung domain 'ppkd.com'.
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    } else if (!value.contains('@')) {
                      return "Email tidak valid";
                    }
                    return null; // Mengembalikan null berarti input valid.
                  },

                  controller: emailC,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color.fromARGB(255, 252, 249, 249),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Input Password
                TextFormField(
                  validator: (value) {
                    // Aturan validasi konfirmasi password:
                    // 1. Tidak boleh kosong.
                    // 2. Minimal 8 karakter.
                    // 3. Harus sama nilainya dengan input passwordController.
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    } else if (value.length < 8) {
                      return "Password kurang dari 8 karakter";
                    }
                    return null;
                  },
                  controller: passwordC,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Tombol Login Utama
                tombolLoginRegister(
                  const Color.fromARGB(255, 44, 136, 241),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  teks: "Login",
                ),
                const SizedBox(height: 14),

                tombolLoginRegister(
                  const Color.fromARGB(255, 55, 119, 193),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      register();
                    }
                  },
                  teks: "Register",
                ),

                const SizedBox(height: 30),

                // Pembatas / Divider "Or"
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Color.fromARGB(223, 255, 255, 255),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: Color.fromARGB(248, 255, 255, 255),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color.fromARGB(255, 250, 250, 250),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Tombol Login via Facebook
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigasi alternatif ke halaman DrawerDay13
                      context.push(const DrawerDay13());
                    },
                    icon: Image.asset('assets/Google.jpg', cacheHeight: 10),
                    label: const Text(
                      'Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: socialBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Tombol Login via Gmail
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset('assets/Facebook.jpg', cacheHeight: 10),
                    label: const Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: socialBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Footer: Already have an account ? Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already Have An Account ? ',
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Aksi navigasi ke halaman Sign In jika ada
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox tombolLoginRegister(
    Color primaryBgColor, {
    required void Function()? onPressed,
    required String teks,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: primaryBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          teks,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
