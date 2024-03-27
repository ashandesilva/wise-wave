import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key key = const Key('default')}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 110.0),
        decoration: setMainBgGradient(),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Card(
                    shadowColor: const Color.fromARGB(67, 0, 0, 0),
                        elevation: 10,
                        color: const Color(0xFFE3F4F7),
                        surfaceTintColor: const Color(0xFFE3F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20), // Add the padding to the top
                        child: Text(
                          'KAI Says', // Add the title here
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Transform.rotate(
                                  angle: 3.14159, // Rotate by 180 degrees (pi radians)
                                  child: Image(
                                    image: AssetImage("assets/images/fa_quote-left.png"),
                                    
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: SizedBox(
                                      width: 230,
                                      child: Text(
                                        "This feeling won't last forever. There will be brighter days ahead. Remember, even the darkest night eventually gives way to the sun.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Image(
                                  image: AssetImage("assets/images/fa_quote-left.png"),
                                ),
                              ),
                            ],
                          ),
                        ),    
                        
                      ],
                  
                    ),
                  ),

                  SizedBox(height: 40),

                  Card(
                    shadowColor: const Color.fromARGB(67, 0, 0, 0),
                        elevation: 10,
                        color: const Color(0xFFE3F4F7),
                        surfaceTintColor: const Color(0xFFE3F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    child: Column(
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spent Time",
                              style: TextStyle(
                                  color: Color(0xff373737),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "03 Hrs 14 Mins",
                              style: TextStyle(color: Color(0xff474747), fontSize: 20, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(width: 40),
                        Icon(
                          Icons.access_time,
                          size: 100,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                        
                      ],
                  
                    ),
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

// Data class for the bar graph
class HappinessData {
  final String day;
  final int happiness;

  HappinessData({required this.day, required this.happiness});
}

