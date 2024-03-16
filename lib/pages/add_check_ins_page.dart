import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';

class AddCheckInPage extends StatefulWidget {
  const AddCheckInPage({super.key});

  @override
  State<AddCheckInPage> createState() => _AddCheckInPageState();
}

class _AddCheckInPageState extends State<AddCheckInPage> {
  final List<String> _emotionsList = [
    "REALLY TERRIBLE",
    "SOMEWHAT BAD",
    "COMPLETELY OKAY",
    "PRETTY GOOD",
    "SUPER AWSOME",
  ];
  late int _currentSliderPosition = 2;
  bool _isBottomButtonPressed = false;
  String _bottmButtonText = "Next";

  @override
  Widget build(BuildContext context) {
    Container checkInBody =
        !_isBottomButtonPressed ? _moodTrackerBody() : _noteWriterBody();

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _myAppBar(context),
      body: checkInBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _bottomButton(context),
    );
  }

  Padding _bottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
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
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                if (!_isBottomButtonPressed) {
                  _bottmButtonText = "Submit";
                  _isBottomButtonPressed = true;
                } else {
                  Navigator.pop(context);
                }
              });
            },
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(250, 60)),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: Text(
              _bottmButtonText,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0, 1.5),
                    color: Color.fromARGB(38, 0, 0, 0),
                    blurRadius: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _noteWriterBody() {
    return Container(
      decoration: setMainBgGradient(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  "Why are you feeling\n${_emotionsList[_currentSliderPosition].toLowerCase()}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Epilogue',
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF474747),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _moodTrackerBody() {
    return Container(
      decoration: setMainBgGradient(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 300,
                child: Text(
                  "How are you feeling today?",
                  style: TextStyle(
                    fontSize: 33,
                    fontFamily: 'Epilogue',
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF474747),
                  ),
                ),
              ),
              const SizedBox(height: 115),
              Image(
                width: 200,
                height: 200,
                image: AssetImage(
                  "assets/images/${_emotionsList[_currentSliderPosition]}.png",
                ),
              ),
              const SizedBox(height: 15),
              Text(
                _emotionsList[_currentSliderPosition],
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF474747),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: SliderTheme(
                  data: const SliderThemeData(
                      trackHeight: 15,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 17.0)),
                  child: Slider(
                    value: _currentSliderPosition.toDouble(),
                    activeColor: const Color(0xFFE5ABB5),
                    inactiveColor: const Color(0xFFE5ABB5),
                    thumbColor: const Color(0xFFffffff),
                    min: 0,
                    max: 4,
                    onChanged: (double value) async {
                      setState(() {
                        _currentSliderPosition = value.round().toInt();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _myAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 25,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: GestureDetector(
            onTap: () async {
              Navigator.pop(context);
            },
            child: const Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/close-button.png"),
            ),
          ),
        ),
      ],
    );
  }
}
