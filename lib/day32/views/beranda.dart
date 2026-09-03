import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_application_1alfin/day32/models/post_models.dart';
import 'package:flutter_application_1alfin/day32/service/api_services.dart';
import 'package:flutter_application_1alfin/day32/service/dio_client.dart';

class beranda extends StatefulWidget {
  const beranda({super.key});

  @override
  State<beranda> createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  late final ApiService apiService;
  late Future<RickMorty> _rickMorty;

  @override
  void initState() {
    super.initState();
    // Inisialisasi Dio client & ApiService Retrofit saat widget dipasang
    final dio = createDioClient();
    apiService = ApiService(dio);
    // Memanggil API GET /posts
    _rickMorty = apiService.getAllPosts();
  }

  void _refreshPosts() {
    setState(() {
      _rickMorty = apiService.getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rick and Morty Characters',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<RickMorty>(
        future: _rickMorty,
        builder: (BuildContext context, AsyncSnapshot<RickMorty> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            final List<Result> characters = snapshot.data!.results;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (BuildContext context, int index) {
                final Result character = characters[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(character.image),
                    ),
                    title: Text(character.name),
                    subtitle: Text('status: ${character.status.name}'),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('tidak ada data'));
          }
        },
      ),
    );
  }
}
