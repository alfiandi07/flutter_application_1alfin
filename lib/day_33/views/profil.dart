import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day_13/Drawe.dart';
import 'package:flutter_application_1alfin/day_33/models/profile_response.dart';
import 'package:flutter_application_1alfin/day_33/services/api_services.dart';
import 'package:flutter_application_1alfin/day_33/services/dio_client.dart';
import 'package:flutter_application_1alfin/day_33/services/token_storage.dart';

class profiltest extends StatefulWidget {
  const profiltest({super.key});

  @override
  State<profiltest> createState() => _profiltestState();
}

class _profiltestState extends State<profiltest> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final ApiService _apiService;
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _checkSavedToken();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Jika token sudah tersimpan, langsung masuk ke Halaman Profil
  Future<void> _checkSavedToken() async {
    final token = await TokenStorage.getToken();
    if (token != null && token.isNotEmpty && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileDetailScreen(
            token: token,
            apiService: _apiService,
          ),
        ),
      );
    }
  }

  // Menghubungkan tombol Login ke API Login
  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _apiService.login({
        'email': emailController.text.trim(),
        'password': passwordController.text,
      });

      final token = response.data?.token;
      if (token != null && token.isNotEmpty) {
        // Simpan token ke secure storage
        await TokenStorage.saveToken(token);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message ?? 'Login Berhasil!'),
              backgroundColor: Colors.green,
            ),
          );

          // Masuk ke halaman profil
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileDetailScreen(
                token: token,
                apiService: _apiService,
              ),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message ?? 'Token tidak ditemukan'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['message'] ??
          e.message ??
          'Login gagal. Periksa email dan password.';
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $errorMsg'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Dialog Registrasi Akun Baru
  void _showRegisterDialog() {
    final regNameController = TextEditingController();
    final regEmailController = TextEditingController();
    final regPassController = TextEditingController();
    final regFormKey = GlobalKey<FormState>();
    bool isRegistering = false;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: const Text('Registrasi Akun Baru', style: TextStyle(fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Form(
                  key: regFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: regNameController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (val) => val == null || val.isEmpty ? 'Nama tidak boleh kosong' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: regEmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) return 'Email tidak boleh kosong';
                          if (!val.contains('@')) return 'Format email tidak valid';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: regPassController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        validator: (val) => val == null || val.length < 6 ? 'Password minimal 6 karakter' : null,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isRegistering ? null : () => Navigator.pop(ctx),
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 125, 34, 199),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: isRegistering
                      ? null
                      : () async {
                          if (!regFormKey.currentState!.validate()) return;
                          setDialogState(() => isRegistering = true);
                          try {
                            final response = await _apiService.register({
                              'name': regNameController.text.trim(),
                              'email': regEmailController.text.trim(),
                              'password': regPassController.text,
                            });
                            if (mounted) {
                              Navigator.pop(ctx);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(response.message ?? 'Registrasi berhasil! Silakan login.'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              emailController.text = regEmailController.text.trim();
                            }
                          } on DioException catch (e) {
                            final msg = e.response?.data?['message'] ?? e.message ?? 'Registrasi gagal';
                            setDialogState(() => isRegistering = false);
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: $msg'), backgroundColor: Colors.red),
                              );
                            }
                          }
                        },
                  child: isRegistering
                      ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text('Daftar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 201, 201),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Align(
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
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Welcome back to Estero. Have a good time",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 104, 103, 103),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
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
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Email tidak boleh kosong";
                                } else if (!value.contains('@')) {
                                  return "Email tidak valid";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
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
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
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
                              obscureText: _obscurePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password tidak boleh kosong";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Your Password",
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Fitur lupa password segera hadir')),
                            );
                          },
                          child: const Text(
                            "Forget Password ?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Container(
                        height: 60,
                        width: 350,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 125, 34, 199),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: Center(
                          child: _isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                                )
                              : const Text(
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
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.all(25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: Color.fromARGB(255, 17, 14, 14),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text("Or continue with"),
                          SizedBox(width: 15),
                          Expanded(
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: Color.fromARGB(255, 17, 14, 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton("assets/flat-color-icons_google.png"),
                        const SizedBox(width: 20),
                        _buildSocialButton("assets/cib_apple.png"),
                        const SizedBox(width: 20),
                        _buildSocialButton("assets/Frame 1.png"),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        TextButton(
                          onPressed: _showRegisterDialog,
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 1, 18, 167),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      height: 50,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          height: 28,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.account_circle, color: Colors.grey),
        ),
      ),
    );
  }
}

// Halaman Detail Profil Pengguna (Day 33)
class ProfileDetailScreen extends StatefulWidget {
  final String token;
  final ApiService apiService;

  const ProfileDetailScreen({
    super.key,
    required this.token,
    required this.apiService,
  });

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  late Future<ProfileResponse> _profileFuture;
  ProfileData? _currentProfile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() {
    setState(() {
      _profileFuture = widget.apiService.getProfile('Bearer ${widget.token}').then((res) {
        _currentProfile = res.data;
        return res;
      });
    });
  }

  // Logout
  Future<void> _logout() async {
    await TokenStorage.clearToken();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const profiltest()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berhasil keluar (Logout)'),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  // Dialog Update Profile
  void _showEditProfileDialog() {
    final nameEditController = TextEditingController(text: _currentProfile?.name ?? '');
    final emailEditController = TextEditingController(text: _currentProfile?.email ?? '');
    final editFormKey = GlobalKey<FormState>();
    bool isSaving = false;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: const Text('Update Profile', style: TextStyle(fontWeight: FontWeight.bold)),
              content: Form(
                key: editFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nameEditController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (v) => v == null || v.isEmpty ? 'Nama tidak boleh kosong' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: emailEditController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Email tidak boleh kosong';
                        if (!v.contains('@')) return 'Format email tidak valid';
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSaving ? null : () => Navigator.pop(ctx),
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 125, 34, 199),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: isSaving
                      ? null
                      : () async {
                          if (!editFormKey.currentState!.validate()) return;
                          setDialogState(() => isSaving = true);
                          try {
                            final res = await widget.apiService.updateProfile(
                              'Bearer ${widget.token}',
                              {
                                'name': nameEditController.text.trim(),
                                'email': emailEditController.text.trim(),
                              },
                            );
                            if (mounted) {
                              setState(() {
                                _currentProfile = res.data;
                              });
                              Navigator.pop(ctx);
                              _loadProfile();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(res.message ?? 'Profil berhasil diperbarui'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          } on DioException catch (e) {
                            final msg = e.response?.data?['message'] ?? e.message ?? 'Gagal memperbarui profil';
                            setDialogState(() => isSaving = false);
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: $msg'), backgroundColor: Colors.red),
                              );
                            }
                          }
                        },
                  child: isSaving
                      ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text('Simpan'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text(
          'Profil Pengguna',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 125, 34, 199),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Profil',
            onPressed: _loadProfile,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: _logout,
          ),
        ],
      ),
      body: FutureBuilder<ProfileResponse>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 60),
                    const SizedBox(height: 12),
                    Text('Gagal memuat profil: ${snapshot.error}', textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadProfile,
                      child: const Text('Coba Lagi'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: _logout,
                      child: const Text('Kembali ke Login'),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData && snapshot.data?.data != null) {
            final profile = snapshot.data!.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Card Profil Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 46,
                          backgroundColor: const Color.fromARGB(255, 125, 34, 199).withOpacity(0.15),
                          child: Text(
                            (profile.name != null && profile.name!.isNotEmpty)
                                ? profile.name![0].toUpperCase()
                                : 'U',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 125, 34, 199),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          profile.name ?? 'Nama Pengguna',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          profile.email ?? '-',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: _showEditProfileDialog,
                          icon: const Icon(Icons.edit, size: 18),
                          label: const Text('Edit Profil'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 125, 34, 199),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Detail Informasi Akun
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Informasi Akun',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 24),
                        _buildInfoRow(Icons.badge, 'ID Pengguna', '${profile.id ?? '-'}'),
                        const SizedBox(height: 12),
                        _buildInfoRow(
                          Icons.verified,
                          'Status Email',
                          profile.emailVerifiedAt != null ? 'Terverifikasi' : 'Belum Verifikasi',
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow(Icons.calendar_today, 'Terdaftar Pada', profile.createdAt ?? '-'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tombol ke Drawer Day 13
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DrawerDay13()),
                        );
                      },
                      icon: const Icon(Icons.dashboard_outlined),
                      label: const Text('Buka Menu Drawer (Day 13)', style: TextStyle(fontSize: 16)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 125, 34, 199),
                        side: const BorderSide(color: Color.fromARGB(255, 125, 34, 199)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Tombol Logout
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _logout,
                      icon: const Icon(Icons.logout),
                      label: const Text('Keluar dari Akun (Logout)', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Data profil tidak ditemukan.'));
          }
        },
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color.fromARGB(255, 125, 34, 199)),
        const SizedBox(width: 12),
        Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        const Spacer(),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      ],
    );
  }
}
