import 'package:flutter/material.dart';

import '../Models/place_model.dart';
import '../data/place_data.dart';
import 'al_masmak_palace.dart';
import 'home_screen.dart';

class QasrAlHukm extends StatefulWidget {
  const QasrAlHukm({super.key});

  @override
  State<QasrAlHukm> createState() => _QasrAlHukmState();
}

class _QasrAlHukmState extends State<QasrAlHukm> {
  // قائمة الوجهات من نوع PlaceModel
  List<PlaceModel> places = [];

  // تحويل بيانات JSON إلى Model
  void getData() {
    for (var place in placeData) {
      places.add(PlaceModel.fromJson(place));
    }
  }

  // استدعاء getData عند تشغيل الشاشة
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 11, 68, 13),
        centerTitle: true,
        title: const Text(
          "محطة قصر الحكم",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 15,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الوجهات السياحية القريبة",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 11, 68, 13),
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];

                return GestureDetector(
                  onTap: () {
                    if (place.name == "قصر المصمك") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlMasmakPalace(
                            place: place,
                          ),
                        ),
                      );
                    }
                  },
                  child: PlaceCard(
                    name: place.name,
                    description: place.description,
                    image: place.image,
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "المفضلة",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: "المحطات",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFF757175),
            ),
            label: "الرئيسية",
            backgroundColor: Color(0xFF757175),
          ),
        ],
      ),
    );
  }
}

// كرت الوجهة
class PlaceCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  const PlaceCard({
    super.key,
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Row(
        children: [
          // معلومات الوجهة
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 5),

                      const Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 11, 68, 13),
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // صورة الوجهة
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              width: screenHeight * 0.15,
              height: screenHeight * 0.15,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}