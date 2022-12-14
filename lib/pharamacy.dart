import 'package:flutter/material.dart';
import 'package:kura_health/splash.dart';
import 'main.dart';
import 'classes.dart';
class PharmacyApp extends StatefulWidget {
  const PharmacyApp({Key? key}) : super(key: key);
  @override
  State<PharmacyApp> createState() => _PharmacyAppState();
}
class _PharmacyAppState extends State<PharmacyApp> {
  List<Book> books = allBooks;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 30), onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const KuraApp()));
          },
          ),
          actions: const [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Color.fromRGBO(64, 188, 140, 1),
            )
          ],
        ),
        body: Header(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 35, 35, 35),
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
            height: 50,
            width: 350.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Type your search',
                  hintStyle: TextStyle(
                    color: Colors.black12,
                  ),
                  icon: Icon(Icons.search),
                ),
                onChanged: searchBook,
              ),
            ),
          ),
        ],
      ),
    ),
      child2: SizedBox(
        height: 450,
        child: ListView.builder(itemCount: books.length,itemBuilder: (context, index){
              final book = books[index];
              return Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(children: [
                        Expanded(flex: 2, child: Image.network(book.urlImage,height: 100, fit: BoxFit.fitWidth,)), const SizedBox(width: 40),
                        Expanded(
                          flex: 1,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold),), Text(book.address), Text(book.distance, style: const TextStyle(color: Colors.black54)),Row(children: [book.rowStar,book.rowStar,book.rowStar,book.rowStar,],)
                          ],),
                        )

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
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    setState(() => books = suggestions);
    if (books != suggestions){
      const Text('Search not found');
    }
  }
}
class Book{
  final String title;
  final String urlImage;
  final String blogLink;
  final String address;
  final String distance;
  final Widget rowStar;

  Book({
    required this.title, required this.urlImage, required this.blogLink, required this.address, required this.distance, required this.rowStar,
  });
}
var allBooks = [
  Book(
      title: 'false Bla la', distance: '2KM away from you', address: '17, Iyaro Street ', rowStar: const Icon(Icons.star, color: Colors.yellow,),  urlImage: 'data:image/jpeg;base64,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', blogLink: 'https://unsplash.com/s/photos/pi'
  ),
  Book(
      title: 'true Bla la', distance: '2KM away from you', address: '17, Iyaro Street ', rowStar: const Icon(Icons.star, color: Colors.yellow,), urlImage: 'https://unsplash.com/s/photos/pi1', blogLink: 'https://unsplash.com/s/photos/pi'
  ),
  Book(
      title: 'tout Bla la', urlImage: 'https://unsplash.com/s/photos/pi1', distance: '2KM away from you', address: '17, Iyaro Street ', rowStar: const Icon(Icons.star, color: Colors.yellow,), blogLink: 'https://unsplash.com/s/photos/pi'
  ),
];
