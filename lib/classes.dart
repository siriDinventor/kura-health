import 'package:flutter/material.dart';
import 'pharamacy.dart';
class Header extends StatelessWidget{
  final Widget child;
  final Widget child2;
  const Header({Key? key, required this.child, required this.child2}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        child,
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(150, 30),
            topRight: Radius.elliptical(200, 30)),
                      ),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: child2,
                      ),
                    ),
        )
      ],
    );
  }
}
class CustomHeader extends StatefulWidget {
  final String title;
  final String hintText;
  final Widget other;
  const CustomHeader({Key? key, required this.title, required this.hintText, required this.other}) : super(key: key);
  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}
class _CustomHeaderState extends State<CustomHeader> {
  List<Book> books = allBooks;
  @override
  Widget build(BuildContext context) {
    return Header(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 35, 35, 35),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(widget.title,
                   style: const TextStyle(fontSize: 30,
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
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: const TextStyle(
                          color: Colors.black12,
                        ),
                        icon: const Icon(Icons.search),
                      ),
                      onChanged: searchBook,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        child2: widget.other);

  }
  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    setState(() => books = suggestions);
  }
}
class Phospital extends StatelessWidget {
  List<Book> books = allBooks;
  final String Title;
  final String address;
  final String distance;
  final Widget rowStar;
     Phospital ({Key? key, required this.Title, required this.address, required this.distance, required this.rowStar,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomHeader(title: Title, hintText: Title, other: ListView.builder(itemCount: books.length,itemBuilder: (context, index){
      final book = books[index];
      return Padding(
          padding: const EdgeInsets.all(34.0),
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
        SizedBox(height: 100, width: 200, child: Image.network(book.urlImage,fit: BoxFit.cover, height: 100,width: 200,)), SizedBox(width: 40,), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(book.title), Text(address), Text(distance), Row(children: [rowStar,rowStar,rowStar,rowStar,],)],)
            ],)
          ],
        ),
      );
          // child: ListTile(
          //   leading: SizedBox(height: 900, width: 250, child: Image.network(book.urlImage,fit: BoxFit.fitHeight, scale: 4,)), trailing: Column(children: [Text(book.title), ],),
          //   // title: Text(book.title), trailing: SizedBox(height: 300, width: 250, child: Image.network(book.urlImage, fit: BoxFit.cover)), ),
          // ));
    }, ),
    );
  }
}