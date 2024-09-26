import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // Batasi lebar maksimal
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 189, 185, 185).withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile Image
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/aldo.jpeg"), // Profile image
                  ),
                  const SizedBox(height: 20),

                  // Name
                  const Text(
                    'Aldo Permana Saputra',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Bio or Description
                  const Text(
                    'Flutter Developer & Tech Enthusiast',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your logic here
                        },
                        icon: const Icon(Icons.message),
                        label: const Text('Message'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your logic here
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Follow'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Detail Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.info),
                    label: const Text('Detail'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Halaman Detail yang menampilkan biodata diri
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5), // Jarak antar elemen
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Atur teks rata kiri
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Biodata'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // Mengurangi lebar Card
            child: Card(
              elevation: 8, // Menambahkan bayangan pada Card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Membuat sudut Card melengkung
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, // Seluruh teks diatur rata kiri
                  children: [
                    const Text(
                      'Biodata Diri',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Detail biodata menggunakan Row dan Expanded untuk layout
                    _buildDetailRow('Nama', 'Aldo Permana Saputra'),
                    _buildDetailRow('Umur', '17 tahun'),
                    _buildDetailRow('Profesi', 'Flutter Developer'),
                    _buildDetailRow('Hobi', 'Coding, Bermain game, Membaca buku'),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
