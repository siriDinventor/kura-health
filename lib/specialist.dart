import 'package:flutter/material.dart';
import 'package:kura_health/classes.dart';
import 'main.dart';
class Specialist extends StatefulWidget {
  const Specialist({Key? key}) : super(key: key);

  @override
  State<Specialist> createState() => _SpecialistState();
}

class _SpecialistState extends State<Specialist> {
  List<Book> books = allBooks;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 30), onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const KuraApp()));
          },
          ),
        ),
        body: Header(
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Find Your Pharmacy',
                  style: TextStyle(fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w100),),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 400,
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)),
                    color: Colors.white,
                  ),
                  child: Container(
                    width: 400,
                    height: 50,
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Find Your Pharmacy',
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          ),
                          constraints: BoxConstraints(
                            minHeight: 40,
                          ),
                          icon: Icon(Icons.search),
                        ),
                        onChanged: searchBook
                    ),
                  ),
                  // child: TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Type your search',
                  //         hintStyle: TextStyle(
                  //           color: Colors.black12,
                  //         ),
                  //     constraints: BoxConstraints(
                  //       minHeight: 40,
                  //     ),
                  //     icon: Icon(Icons.search),
                  //   ),
                  // ),
                  // child: TextField(
                  //   decoration: const InputDecoration(
                  //     hintText: 'Type your search',
                  //     hintStyle: TextStyle(
                  //       color: Colors.black12,
                  //     ),
                  //     icon: Icon(Icons.search),
                  //   ),
                  //   onChanged: searchBook,
                  // ),
                ),
              ],
            ),
          ),
          child2: SizedBox(
            child: ListView.builder(itemCount: books.length,itemBuilder: (context, index){
              final book = books[index];
              return Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(children: [
                        SizedBox(height: 79, width: 150, child: Image.network(book.urlImage,fit: BoxFit.cover, height: 70,width: 150,)), const SizedBox(width: 40),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(book.specialistName), Text(book.yoe,style: const TextStyle(fontWeight: FontWeight.bold),),Row(children: [book.rowStar,book.rowStar,book.rowStar,book.rowStar,],)
                        ],)

                      ],)
                    ],
                  ));
            }, ),
          ),
        ),
      ),
    );
  }
  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.specialistName.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    setState(() => books = suggestions);
  }
}
class Book{
  final String specialistName;
  final String yoe;
  final Widget rowStar;
  final String urlImage;

  Book({
    required this.specialistName, required this.urlImage,required this.rowStar,required this.yoe,
  });
}
var allBooks = [
  Book(
      yoe: 'false', urlImage: 'tap', rowStar: const Icon(Icons.star, color: Colors.yellow,), specialistName: 'Dr.Astrid'
  ),
  Book(
    yoe: 'true Bla la',urlImage: 'tap', rowStar: const Icon(Icons.star, color: Colors.yellow,),  specialistName: 'Dr.Astrid'
  ),
  Book(
    yoe: 'tout Bla la',urlImage: 'tap', rowStar: const Icon(Icons.star, color: Colors.yellow,),  specialistName: 'Dr.Astrid'
  ),
];
// class SpecialistTile{
//   final String name;
//   final String;
//  ({required this.name})
// }