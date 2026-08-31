import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/place_model.dart';

class AlMasmakPalace extends StatelessWidget {
  final PlaceModel place;

  const AlMasmakPalace({super.key, required this.place});

  Future<void> openMap() async {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=قصر+المصمك+الرياض',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 11, 68, 13),
        centerTitle: true,
        title: Text(
          place.name,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // صورة المكان
            Image.asset(
              place.image,
              width: double.infinity,
              height: screenHeight * 0.45,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 15),

            // التقييم + الموقع
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: openMap,
                    child: const Text(
                      "عرض الموقع\nعلى الخريطة",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Text(
                    "4.5",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(width: 8),

                  const Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFFB300), size: 25),
                      Icon(Icons.star, color: Color(0xFFFFB300), size: 25),
                      Icon(Icons.star, color: Color(0xFFFFB300), size: 25),
                      Icon(Icons.star, color: Color(0xFFFFB300), size: 25),
                      Icon(Icons.star_half, color: Color(0xFFFFB300), size: 25),
                    ],
                  ),

                  const SizedBox(width: 8),

                  const Text(
                    "تقييم المكان",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // مسافة المشي
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "5 دقائق مشي",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(width: 8),

                  const Icon(
                    Icons.directions_walk,
                    color: Color.fromARGB(255, 11, 68, 13),
                    size: 28,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // عنوان النبذة
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "نبذة عن المكان",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 11, 68, 13),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // وصف المكان
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "قصر المصمك معلم تاريخي بارز في مدينة الرياض، "
                "ويُعد من أهم المواقع المرتبطة بتاريخ المملكة العربية السعودية. "
                "بُني القصر من الطين واللبن، ويتميز بتصميمه التراثي وأبراجه ومداخله القديمة.",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
