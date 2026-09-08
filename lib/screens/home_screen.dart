import 'package:flutter/material.dart';
import 'package:project_1_flutter/services/database.dart';

import '../Models/station_model.dart';
import '../data/station_data.dart';
import 'qasr_al_hukm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // قائمة المحطات من نوع StationModel
  List<StationModel> stations = [];

  // تحويل بيانات JSON إلى Model
  void getData() {
    for (var station in stationData) {
      stations.add(StationModel.fromJson(station));
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 11, 68, 13),
        centerTitle: true,
        title: const Text(
          "سكة",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),

      body: FutureBuilder(
        future: Database().getAllPlaces(),
        builder: (context, asyncSnapshot) {

          return Column(
            children: [
              // Search Bar
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: const TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "اختر محطتك",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
          
              // عنوان المحطات
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "المحطات",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(255, 11, 68, 13),
                    ),
                  ),
                ),
              ),
          
              const SizedBox(height: 5),
          
              // المحطات
              Expanded(
                child: ListView.builder(
                  itemCount: stations.length,
                  itemBuilder: (context, index) {
                    final station = stations[index];
          
                    return GestureDetector(
                      onTap: () {
                        if (station.name == "محطة قصر الحكم") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QasrAlHukm(),
                            ),
                          );
                        }
                      },
                      child: Container(
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
                            // معلومات المحطة
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // اسم المحطة
                                    Text(
                                      station.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
          
                                    // المسار
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          station.line,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Icon(
                                          Icons.circle,
                                          color: station.color,
                                          size: 18,
                                        ),
                                      ],
                                    ),
          
                                    // الوجهات
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          station.destinations,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Icon(
                                          Icons.location_on,
                                          color: station.color,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
          
                            // الصورة
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                station.image,
                                width: screenHeight * 0.15,
                                height: screenHeight * 0.15,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
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