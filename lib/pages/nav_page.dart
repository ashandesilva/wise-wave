import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wisewave/components/my_app_bar.dart';
import 'package:wisewave/components/theme/nav_bg_gradient.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:wisewave/screens/chat_screen.dart';
import 'package:wisewave/screens/check_in_screen.dart';
import 'package:wisewave/screens/home_screen.dart';
import 'package:wisewave/screens/user_profile_screen.dart';
import 'package:iconify_flutter/icons/fa.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key, required this.index});

  final int index;

  @override
  // ignore: no_logic_in_create_state
  State<NavPage> createState() => _NavPageState(index);
}

class _NavPageState extends State<NavPage> {
  _NavPageState(this.currentPageIndex);

  int currentPageIndex;
  bool _isFabButtonToggle = false;

  final String _userName = "Naaji";

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: currentPageIndex == 3 || currentPageIndex == 2
          ? _getAltAppBar()
          : myAppBar(
              "$_userName!",
              UserProfileScreen(userName: _userName).userProfilePic,
            ),
      body: getNavScreenBody[currentPageIndex],
      floatingActionButton: getFabButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: getBottomNavBar(),
    );
  }

  List<Widget> get getNavScreenBody {
    return <Widget>[
      // Home screen content.
      const HomeScreen(),
      // checkIns screen content.
      const CheckInScreen(),
      // Chat screen content.
      const ChatScreen(),
      // User profile screen content.
      UserProfileScreen(userName: _userName),
    ];
  }

  Padding getFabButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _isFabButtonToggle = !_isFabButtonToggle;
              });
            },
            elevation: 0,
            backgroundColor: const Color(0xFF59B292),
            child: _isFabButtonToggle
                ? const Iconify(
                    Fa.close,
                    size: 24,
                    color: Color(0xffF2FFE9),
                  )
                : const Iconify(
                    Fa.plus,
                    size: 24,
                    color: Color(0xffF2FFE9),
                  ),
          ),
        ),
      ),
    );
  }

  Container getBottomNavBar() {
    return Container(
      decoration: setNavBgGradient(),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            _home_navigator(),
            _check_in_navigator(),
            _message_navigator(),
            _user_profile_navigator(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  NavigationDestination _user_profile_navigator() {
    return const NavigationDestination(
      selectedIcon: Badge(
        alignment: Alignment(0, -7.8),
        smallSize: 19,
        backgroundColor: Color(0xFF53A688),
        child: Iconify(
          Bxs.user,
          size: 30,
          color: Color(0xFF53A688),
        ),
      ),
      icon: Iconify(
        Bx.user,
        size: 30,
        color: Color(0xFF472732),
      ),
      label: 'user',
    );
  }

  // ignore: non_constant_identifier_names
  Padding _message_navigator() {
    return const Padding(
      padding: EdgeInsets.only(left: 70),
      child: NavigationDestination(
        selectedIcon: Badge(
          alignment: Alignment(0, -7.8),
          smallSize: 19,
          backgroundColor: Color(0xFF53A688),
          child: Iconify(
            Bxs.message,
            size: 30,
            color: Color(0xFF53A688),
          ),
        ),
        icon: Iconify(
          Bx.message,
          size: 30,
          color: Color(0xFF472732),
        ),
        label: 'Messages',
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding _check_in_navigator() {
    return const Padding(
      padding: EdgeInsets.only(right: 70),
      child: NavigationDestination(
        selectedIcon: Badge(
          alignment: Alignment(0, -7.8),
          smallSize: 19,
          backgroundColor: Color(0xFF53A688),
          child: Iconify(
            Bxs.bookmark,
            size: 30,
            color: Color(0xFF53A688),
          ),
        ),
        icon: Iconify(
          Bx.bookmark,
          size: 30,
          color: Color.fromARGB(255, 71, 39, 50),
        ),
        label: 'Notifications',
      ),
    );
  }

  // ignore: non_constant_identifier_names
  NavigationDestination _home_navigator() {
    return const NavigationDestination(
      selectedIcon: Badge(
        alignment: Alignment(0, -7.8),
        smallSize: 19,
        backgroundColor: Color(0xFF53A688),
        child: Iconify(
          Bxs.home_alt_2,
          color: Color(0xFF53A688),
          size: 30,
        ),
      ),
      icon: Iconify(
        Bx.home_alt_2,
        size: 30,
        color: Color(0xFF472732),
      ),
      label: 'Home',
    );
  }

  AppBar _getAltAppBar() {
    return AppBar(
      title: Text(
        currentPageIndex == 3
            ? "Profile"
            : currentPageIndex == 2
                ? "AI Assistant"
                : "",
        style: const TextStyle(
          color: Color(0xFF373737),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 242, 195, 178),
              Color.fromARGB(255, 229, 168, 182)
            ],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
