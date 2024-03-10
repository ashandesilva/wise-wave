import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wisewave/components/square_tile.dart';

class SignupPage extends StatefulWidget {
  final Function()? onTap;
  const SignupPage({super.key, required this.onTap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
            child: Container(
                 height: MediaQuery.of(context).size.height,
                 width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfff2c2b1),
                      Color(0xffe5a8b6)
                    ], // Change these colors as needed
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Image.asset('assets/images/final-logo-of-wise-wave.png',
                        fit: BoxFit.cover,
                        width: 155,
                        height: 151,
                  )
                      // child: Image.asset(
                      //   'assets/your_logo_image.png',
                      //   width: 155,
                      //   height: 151, // Adjust the height as needed
                      //   // You can also use AssetImage if the image is in your project
                      //   // asset('assets/your_logo_image.png'),
                      // ),
                    ),
                    const SizedBox(height: 50),
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //2nd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://wallpaperaccess.com/full/2637581.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://wallpaperaccess.com/full/2637581.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      //Slider Container properties
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 500),
                        viewportFraction: 0.8,
                      ),
                    ),
                    const SizedBox(height: 50),
                  //   Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  //         child: const Divider(
                  //           thickness: 2,
                  //           color: Color(0xff000000),
                  //           height: 36,
                  //         ),
                  //       ),
                  //     ),
                  //     // const Padding(
                  //     //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  //     //   child: Text(
                  //     //     'or',
                  //     //     style: TextStyle(
                  //     //       fontFamily: 'Rubik',
                  //     //       fontSize: 15,
                  //     //       fontWeight: FontWeight.bold,
                  //     //       height: 0.5,
                  //     //       color: Color(0xff000000),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     // Expanded(
                  //     //   child: Container(
                  //     //     margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //     //     child: const Divider(
                  //     //       thickness: 2,
                  //     //       color: Color(0xff000000),
                  //     //       height: 36,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  //const SizedBox(height: 20),
                  
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //google
                      const SquareTile(imagePath: 'assets/images/google.jpeg',),
                      // //apple
                      // SquareTile(imagePath: 'assets/images/apple.jpeg'),
                       Container(
                        //margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: const Text(
                          'Login With Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  //signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 17,
                          height: 0.5,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 0.5,
                            color: Color.fromARGB(255, 107, 167, 245),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ],
                )
              )
            )
    );
  }
}