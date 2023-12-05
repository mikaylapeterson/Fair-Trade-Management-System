import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fairtrade_certification_management_system/Models/event.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int currentPageIndex = 0;
  DateTime today = DateTime.now();
  Map<DateTime, List<Event>> events = {};
  final eventName = TextEditingController();
  late final ValueNotifier<List<Event>> selectedEvents;

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.deepPurple,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist),
            label: 'Checklist',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Text("Calendar",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                ),
                // add an event
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text("Checklist Item Name"),
                            content: Padding(padding: EdgeInsets.all(8),
                            child: TextField(
                              controller: eventName,
                            ),),
                            actions: [
                              ElevatedButton(onPressed: () {
                                //events.addAll(selectedDay!: [Event(eventName.text)]);
                                Navigator.of(context).pop();
                              }, child: Text("Submit"))
                            ],
                          );
                        });
                      }),
                      const SizedBox(width: 10),
                      // add an event
                    FloatingActionButton(
                      child: const Icon(Icons.delete_forever),
                      onPressed: () {
                      }),
                  ],
                ),
                TableCalendar(
                  headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today, 
                  firstDay: DateTime.utc(2010, 1, 1), 
                  lastDay: DateTime.utc(2031, 12, 31),
                  onDaySelected: _onDaySelected,
                  )
              ],
            ),
            ),
        ),
      ),
    );
  }
}