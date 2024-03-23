import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:wisewave/pages/add_check_ins_page.dart';

class AddWorkPage extends StatefulWidget {
  const AddWorkPage({super.key});

  @override
  State<AddWorkPage> createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  late DateTime _focusedDay;
  DateTime? _selectDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    // Initialize _focusedDay to the current date
  }

  final String _bottmButtonText = "Add My Work";
  final TextEditingController _titleTextFieldController =
      TextEditingController();
  final TextEditingController _addDetailsTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      body: _workLoadBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _bottomButton(context),
    );
  }

  Widget _workLoadBody() {
    return Container(
      decoration: setMainBgGradient(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Color(0xFFE3F4F7),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectDay = selectedDay;
                      _focusedDay = _focusedDay;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarStyle: CalendarStyle(
                    // Use `CalendarStyle` to customize the calendar's appearance
                    outsideDaysVisible: true,
                    defaultTextStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    weekendTextStyle:
                        const TextStyle().copyWith(color: Colors.red[800]),
                    holidayTextStyle:
                        const TextStyle().copyWith(color: Colors.green[800]),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    // Use `DaysOfWeekStyle` to customize the appearance of the days of the week
                    weekendStyle:
                        const TextStyle().copyWith(color: Colors.red[600]),
                  ),
                  headerStyle: HeaderStyle(
                    // Use `HeaderStyle` to customize the appearance of the calendar's header
                    formatButtonVisible: false,
                    titleCentered: true,
                    formatButtonShowsNext: true,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    formatButtonTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                    hintText: 'Add Details of the Work...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(122, 71, 71, 71),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
              Navigator.pop(context);
              Navigator.pop(context);
            },
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

  AppBar _myAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          "Workload",
          style: TextStyle(
            color: Color(0xFF373737),
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
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
      actions: <Widget>[
        GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Image(
            width: 45,
            image: AssetImage("assets/images/back-button.png"),
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
}
