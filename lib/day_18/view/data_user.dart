import 'package:flutter/material.dart';
import 'package:flutter_application_1alfin/day_18/database/db_helper.dart';
import 'package:flutter_application_1alfin/day_18/model/user_login_model.dart';
import 'package:flutter_application_1alfin/extensinon/navigator.dart';

class DataUserDay18 extends StatefulWidget {
  const DataUserDay18({super.key});

  @override
  State<DataUserDay18> createState() => _DataUserDay18State();
}

class _DataUserDay18State extends State<DataUserDay18> {
  void _refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<UseMoodelSQL>>(
              future: DBHelper().getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  ); // Center
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Tidak ada data pengguna.'),
                  ); // Center
                }

                final daftarPengguna = snapshot.data!;

                return ListView.builder(
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ), // CircleAvatar
                        title: Text(user.email),
                        subtitle: Text('Password: ${user.password}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _showBottomSheet(context, user);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                _showBottomSheet(context, user);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ), // ListTile
                    ); // Card
                  },
                ); // ListView.builder
              },
            ), // FutureBuilder
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, UseMoodelSQL? user) {
    // Inisialisasi controller teks dari data pengguna yang dipilih (jika ada).
    final emailController = TextEditingController(text: user?.email ?? "");
    final passwordController = TextEditingController(
      text: user?.password ?? "",
    );
    final noHpController = TextEditingController(text: user?.noHp ?? "");
    final kotaController = TextEditingController(text: user?.kota ?? "");

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Supaya bottom sheet menyesuaikan tinggi keyboard
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Kelola Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Input Email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Input Password
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Input Nomor HP
              TextField(
                controller: noHpController,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: kotaController,
                decoration: const InputDecoration(
                  labelText: 'kota',
                  border: OutlineInputBorder(),
                ),
              ),

              // Aksi 1: Tambah Pengguna Baru
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Tambah',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final newUser = UseMoodelSQL(
                    email: emailController.text.trim(),
                    password: passwordController.text,
                    noHp: noHpController.text,
                    kota: kotaController.text,
                  );

                  bool success = await DBHelper().registerUser(newUser);
                  if (success && context.mounted) {
                    Navigator.pop(context);
                    _refreshList();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data berhasil ditambahkan'),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              // Baris Aksi 2 & 3: Update dan Delete Data Pengguna
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Aksi 2: Update Pengguna
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (user?.id != null) {
                        final updatedUser = UseMoodelSQL(
                          id: user?.id,
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          noHp: noHpController.text,
                          kota: kotaController.text,
                        );

                        bool success = await DBHelper().updateUser(updatedUser);
                        if (success && context.mounted) {
                          Navigator.pop(context);
                          _refreshList();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil diperbarui'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  // Aksi 3: Delete Pengguna
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("info"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Hapus aja ga penting,"),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: Text("Kembali"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await DBHelper().deleteUser(user!.id!);
                                      if (context.mounted) {
                                        Navigator.pop(context);
                                        _refreshList();
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Data berhasil dihapus',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text("Yes"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
