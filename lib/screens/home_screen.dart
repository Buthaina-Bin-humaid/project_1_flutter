import 'package:flutter/material.dart';

import 'qasr_al_hukm.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> stations = [
    {
      "name": "محطة المركز المالي",
      "image": "assets/financial.jpg",
      "line": "المسار الأزرق",
      "destinations": "5 وجهات",
      "color": const Color(0xFF0072BC),
    },
    {
      "name": "محطة قصر الحكم",
      "image": "assets/qasr_al_hukm.jpg",
      "line": "المسار البرتقالي",
      "destinations": "3 وجهات",
      "color": const Color(0xFFF58220),
    },
    {
      "name": "محطة المتحف الوطني",
      "image": "assets/national_museum.jpg",
      "line": "المسار الأخضر",
      "destinations": "6 وجهات",
      "color": const Color(0xFF00A651),
    },
    {
      "name": "محطة مكتبة الملك فهد",
      "image": "assets/library.jpg",
      "line": "المسار الأزرق",
      "destinations": "3 وجهات",
      "color": const Color(0xFF0072BC),
    },
    {
      "name": "محطة الربيع",
      "image": "assets/y_line.jpg",
      "line": "المسار الأصفر",
      "destinations": "6 وجهات",
      "color": const Color.fromARGB(255, 163, 166, 0),
    },
  ];

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

      body: Column(
        children: [
          // Search Bar
          //child one
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),

              child: Container(
                width: screenWidth * 0.9,
                height: 50,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),

                  boxShadow: const [BoxShadow(blurRadius: 3, spreadRadius: 1)],
                ),

                child: const TextField(
                  textAlign: TextAlign.right,

                  decoration: InputDecoration(
                    hintText: "اختر محطتك",

                    hintStyle: TextStyle(fontWeight: FontWeight.bold),

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

          //child two
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

          //---------------------------------
          //child three
          // المحطات
          Expanded(
            child: ListView.builder(
              itemCount: stations.length,

              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (stations[index]["name"] == "محطة قصر الحكم") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QasrAlHukm()),
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
                        BoxShadow(blurRadius: 3, spreadRadius: 0.5),
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
                                  stations[index]["name"],

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
                                      stations[index]["line"],

                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(width: 5),

                                    Icon(
                                      Icons.circle,
                                      color: stations[index]["color"],
                                      size: 18,
                                    ),
                                  ],
                                ),

                                // الوجهات
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [
                                    Text(
                                      stations[index]["destinations"],

                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(width: 5),

                                    Icon(
                                      Icons.location_on,
                                      color: stations[index]["color"],
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
                            stations[index]["image"],

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
      ),

      //-------------------------Bottom Bar
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,

        selectedFontSize: 16,
        unselectedFontSize: 16,

        iconSize: 28,

        type: BottomNavigationBarType.fixed,

        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "المفضلة"),

          BottomNavigationBarItem(icon: Icon(Icons.train), label: "المحطات"),

          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF757175)),
            label: "الرئيسية",
            backgroundColor: Color(0xFF757175),
          ),
        ],
      ),
    );
  }
}
