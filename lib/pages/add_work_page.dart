import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:wisewave/pages/add_check_ins_page.dart';

class AddWorkPage extends StatefulWidget {
  const AddWorkPage({super.key});

  @override
  State<AddWorkPage> createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
   String _bottmButtonText = "Add My Work";
  Widget _leadingIcon = const Text('');
  bool _isBottomButtonPressed = false;
  final bool _isSliderChanged = false;
  final TextEditingController _titleTextFieldController =
      TextEditingController();
  final TextEditingController _addDetailsTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
     Container checkInBody =
        !_isBottomButtonPressed ? _workLoadBody() : _workLoadBody();
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
            onPressed: _isSliderChanged
                ? () {
                    setState(() {
                      if (!_isBottomButtonPressed) {
                        _bottmButtonText = "Add Work";
                        _isBottomButtonPressed = true;
                        _leadingIcon = _getLeadingBackIcon();
                      } else {
                        Navigator.pop(context);
                      }
                    });
                  }
                : null,
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(250, 60)),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: Text(
              _bottmButtonText,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
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
  Container _workLoadBody() {
    return Container(
      decoration: setMainBgGradient(),
      child: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 107, 0, 0),
          padding: const EdgeInsets.only(bottom: 100),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _titleTextFieldController,
                    onTap: () async => setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TitleTextfieldScreen(
                            initialValue: _titleTextFieldController.text,
                          ),
                        ),
                      ).then((enteredValue) {
                        if (enteredValue != null) {
                          setState(() {
                            _titleTextFieldController.text = enteredValue;
                          });
                        }
                      });
                    }),
                    autofocus: false,
                    readOnly: true,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE3F4F7),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE3F4F7)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE3F4F7)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Title...',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(122, 71, 71, 71),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _addDetailsTextFieldController,
                    onTap: () async => setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNotesTextfieldScreen(
                            initialValue: _addDetailsTextFieldController.text,
                          ),
                        ),
                      ).then((enteredValue) {
                        if (enteredValue != null) {
                          setState(() {
                            _addDetailsTextFieldController.text = enteredValue;
                          });
                        }
                      });
                    }),
                    maxLines: 3,
                    autofocus: false,
                    readOnly: true,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE3F4F7),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE3F4F7)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE3F4F7)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Add some notes...',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(122, 71, 71, 71),
                      ),
                    ),
                  ),
                ),
              ]
            ),
          )
        ),
      )
    );
  }
  AppBar _myAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      leadingWidth: 65,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 10,
      surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Colors.transparent,
      leading: _leadingIcon,
      actions: <Widget>[
        GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Image(
            width: 45,
            image: AssetImage("assets/images/close-button.png"),
          ),
        ),
        const SizedBox(width: 20),
      ],
      bottom: const PreferredSize(
        preferredSize: Size(0, 10),
        child: SizedBox(height: 0),
      ),
    );
  }
  Row _getLeadingBackIcon() {
    return Row(
      children: [
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              if (_isBottomButtonPressed) {
                _bottmButtonText = "Add My Work";
                _isBottomButtonPressed = false;
                _leadingIcon = const Text('');
              }
            });
          },
          child: const Image(
            width: 45,
            image: AssetImage("assets/images/back-button.png"),
          ),
        ),
      ],
    );
  }
}