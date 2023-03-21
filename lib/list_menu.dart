import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:talitha_fawwaz_kuis/coffee_menu.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String pesanKirim = "Data yang dikirimkan";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Coffee Menu"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final CoffeeMenu dataCoffeMenu = coffeeList[index];
            return Card(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(
                        coffeeMenuTerima: dataCoffeMenu,
                      );
                    }));
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        child: SizedBox(
                          height: 100,
                          width: 130,
                          child: Image.network(dataCoffeMenu.imageUrls[0],
                              fit: BoxFit.cover),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 200.0),
                          ),
                          Text(dataCoffeMenu.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text(dataCoffeMenu.price,
                              style: TextStyle(
                                fontSize: 13,
                              )),
                        ],
                      ),
                    ],
                  )),
            );
          },
          // perulangan
          itemCount: coffeeList.length,
        ),
      ),
    );
  }
}
