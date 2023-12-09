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
  bool? checked = false;
  DateTime today = DateTime.now();
  Map<DateTime, List<Event>> events = {};
  final eventName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final product = TextEditingController();
  final producerNetwork = TextEditingController();
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
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings'),
        ],
      ),
      body: [
        // Calendar Page
        Center(
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
      // Checklist Page
      Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Text("2023 Checklist",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                ),
                // add an event
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const SizedBox(height: 10),
                      Checkbox(value: checked, onChanged: (value) {
                        setState(() {
                          checked = value;
                        });
                      }),
                    Text("Test Item")
                    ],
                    
                  
                ),
                
              ],
            ),
            ),
        ),
      ),
      // Settings Page
      Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Text("Settings",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                ),
                // add an event
                Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:  Colors.deepPurple.withOpacity(0.2)
                    ),
                    child: TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Username"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:  Colors.deepPurple.withOpacity(0.2)
                    ),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Password"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:  Colors.deepPurple.withOpacity(0.2)
                    ),
                    child: TextFormField(
                      controller: product,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "product is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Product"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:  Colors.deepPurple.withOpacity(0.2)
                    ),
                    child: TextFormField(
                      controller: producerNetwork,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "network is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Producer Network"),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple
                    ),
                    child: TextButton(
                      onPressed: () {
                      }, child: const Text(
                        "SAVE",
                        style: TextStyle(color: Colors.white),
                      )),
                  ),
              ],
            ),
            ),
        ),
      ),
      ][currentPageIndex]
    );
  }
}