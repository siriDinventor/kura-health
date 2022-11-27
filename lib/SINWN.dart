import 'package:flutter/material.dart';
import 'classes.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  TextEditingController taskController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  List<Book> reminder = [];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color.fromRGBO(64, 188, 140, 1),
          )
      ),
      home: Scaffold(backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
          appBar: AppBar(
            title: const Text('Reminder', style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),),
            centerTitle: false,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
            actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))],
          ),
          body: Builder(
        builder: (context) => Column(
          children: [
            Expanded(
                child: Header(
                  child: Container(
                    color: const Color.fromRGBO(64, 188, 140, 1),
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
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    showBottomSheet(
                      elevation: 2000,
                        context: context,
                        builder: (context) => SizedBox(
                          height: 300,
                          child: Material(
                            color: Colors.grey,
                            elevation: 70,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(60.0),
                                topRight: Radius.circular(60.0)
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(38.0),
                              child: Column(
                                  children: [
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
                                            Navigator.of(context).pop();
                                          });
                                        },
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          )
                        ));
                  },
                ),
              ),
            ),
          ],
        )
      )),
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