import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wisewave/animation/fade_animation.dart';
import 'package:wisewave/components/auth_service.dart';
import 'package:wisewave/components/square_tile.dart';

class SignupPage extends StatefulWidget {
  final Function()? onTap;
  const SignupPage({super.key, required this.onTap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final myimages = [
    Image.asset('assets/images/page1.jpeg'),
    Image.asset('assets/images/page2.jpeg'),
    Image.asset('assets/images/page3.jpeg'),
    Image.asset('assets/images/page4.jpeg'),
    Image.asset('assets/images/page5.jpeg'),
  ];
  int currentIndex = 0;
  
  //final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
            child: FadeAnimation(1.5, Container(
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
                      child: Image.asset('assets/images/wiseWaveLogo.jpeg',
                        fit: BoxFit.cover,
                        width: 155,
                        height: 151,
                  )
                ),
                   const SizedBox(height: 40),
                   CarouselSlider(items: myimages, options: CarouselOptions(
                    height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 2.0,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 300),
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),                   
                   ),
                    const SizedBox(height: 15),
                   AnimatedSmoothIndicator(activeIndex: currentIndex,
                   count: myimages.length,
                   effect: const ExpandingDotsEffect(
                      dotColor: Color.fromARGB(255, 196, 130, 207),
                      activeDotColor: Colors.deepPurple,
                      dotHeight: 20,
                      dotWidth: 20,
                      spacing: 10,
                   ),),

                    const SizedBox(height: 50),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //google
                      SquareTile(
                        onTap: () => AuthService().signInWithGoogle(), 
                        imagePath: 'assets/images/google.jpeg',),
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
            )
    );   
  }
}