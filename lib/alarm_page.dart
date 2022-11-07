import 'package:flutter/material.dart';
import 'classes.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);
  @override
  State<AlarmPage> createState() => _AlarmPageState();
}
class _AlarmPageState extends State<AlarmPage> with TickerProviderStateMixin {
  Widget buildBottomSheet(context) => MaterialApp();
  late String time;
  late String newDetail;
  late String taskTitle;
  TimeOfDay today = const TimeOfDay(hour: 38, minute: 3);
  // DateTime now = DateTime(2020).now();

  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? response = await showTimePicker(
  //     context: context,
  //     initialTime: pickedTime,
  //   );
  //   if (response != null && response != pickedTime) {
  //     setState(() {
  //       pickedTime = response;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color.fromRGBO(64, 188, 140, 1),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
        appBar: AppBar(
          title: const Text('Reminder', style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),),
          centerTitle: false,
          elevation: 0,
          backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
          actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))],
        ),
        floatingActionButton: const ModalBottomSheetDemo(),
        body: Header(
          child: Container(
            height: 150,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('13', style: TextStyle(color: Colors.white, fontSize: 34,fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Column(crossAxisAlignment:  CrossAxisAlignment.start, children: const [Text('Friday', style: TextStyle(color: Colors.white, fontSize: 18)), Text('November 2021', style: TextStyle(color: Colors.white,fontSize: 18))],)
                  ],
                ),
                 TabBar(indicator: const BoxDecoration(color: Color.fromRGBO(114, 204, 171, 1.0), borderRadius: BorderRadius.all(Radius.circular(5.0)),), labelStyle: const TextStyle(fontSize: 15), unselectedLabelColor: Colors.white,  controller: TabController(length: 7, vsync: this), tabs: const[
                  Text('Sun'),
                  Text('Mon'),
                  Text('Tue'),
                  Text('Wed'),
                  Text('Thur'),
                  Text('Fri'),
                  Text('Sat')
                 ]),
              ],
            ),
          ),
          child2: SizedBox(
            child: ListView.builder(itemCount: reminder.length,itemBuilder: (context, index){
              final book = reminder[index];
              return Padding(padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Column(
                    children: [
                      ListTile(
                        minLeadingWidth: 100,
                        leading: Text(book.time.toString()),
                        title: Text(book.detail),
                        subtitle: Text(book.additionalDetail),
                        // trailing: Checkbox(
                        //   value: false,
                        //   onChanged: (){
                        //   },
                        // ),
                      ),
                    ],
                  ));
            }, ),
          ),
        ),
      ),
    );
  }
}
class ModalBottomSheetDemo extends StatefulWidget {
  const ModalBottomSheetDemo({Key? key}) : super(key: key);
  @override
  State<ModalBottomSheetDemo> createState() => _ModalBottomSheetDemoState();
}

class _ModalBottomSheetDemoState extends State<ModalBottomSheetDemo> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  late int hour;
  late int minute;
  late TimeOfDay time;
  @override
  Widget build(BuildContext context) {
    void  _showModalBottomSheet(){
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Container(
              color: const Color(0xff757575),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                height: 500,
                alignment: Alignment.center,
                child: Wrap(
                  children: [
                    Column(
                        children: [
                          // Container(
                          //   color: Colors.grey,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Expanded(
                          //         child: TextField(
                          //           controller: hourController,
                          //           keyboardType: TextInputType.number,
                          //         ),
                          //       ),
                          //       const Text(':'),
                          //       Expanded(child: TextField(
                          //         controller: minuteController,
                          //         keyboardType: TextInputType.number,
                          //       ),
                          //       )
                          //
                          //     ],
                          //   ),
                          // ),
                          TextField(
                            controller: taskController,
                          ),
                          TextField(
                            controller: detailController,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: ElevatedButton(
                              child: const Text("Close Bottom Sheet"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                  setState(() {
                                    reminder.add(Book(time: TimeOfDay(hour: 4, minute: 4), detail: taskController.text, additionalDetail: detailController.text));
                                    print(reminder);
                                  });
                              },
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
              ),
            ),
          );

        },
      );
    }
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        _showModalBottomSheet();
      },
    );
  }
}
class Book{
  TimeOfDay time;
  final String detail;
  String additionalDetail;
  TimeOfDay today = const TimeOfDay(hour: 8, minute: 3);
  Book({
    required this.time, required this.detail, required this.additionalDetail,
  });
}
var reminder = [
  Book(
    time: const TimeOfDay(hour: 9, minute: 50), detail: 'Oxycodone', additionalDetail: '',
  ),
  Book(
    time: const TimeOfDay(hour: 9, minute: 50), detail: 'Oxycodone', additionalDetail: '30mg.After Eating'
  ),
  Book(
    time: const TimeOfDay(hour: 9, minute: 50), detail: 'Oxycodone', additionalDetail: ''
  ),
];
