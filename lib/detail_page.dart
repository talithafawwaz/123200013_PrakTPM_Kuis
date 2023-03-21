import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:talitha_fawwaz_kuis/coffee_menu.dart';
import 'package:talitha_fawwaz_kuis/favorite_button.dart';

class DetailPage extends StatefulWidget {
  // final String pesanTerima;
  final CoffeeMenu coffeeMenuTerima;

  const DetailPage({
    Key? key,
    // required this.pesanTerima,
    required this.coffeeMenuTerima,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.coffeeMenuTerima.name),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 170,
                width: 165,
                padding: const EdgeInsets.all(12),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.network(widget.coffeeMenuTerima.imageUrls[0]),
                    Image.network(widget.coffeeMenuTerima.imageUrls[1]),
                    Image.network(widget.coffeeMenuTerima.imageUrls[2]),
                  ],
                ),
              ),
              Text(widget.coffeeMenuTerima.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              FavoriteButton(
                onPressed: () {
                  // Handle the favorite button press here
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
              ),
              Card(
                elevation: 10,
                child: Container(
                  height: 220,
                  width: 1280,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Name                    : ${widget.coffeeMenuTerima.name}"),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 1000,
                            child: Text(
                                "Description           : ${widget.coffeeMenuTerima.description}"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Price                      : ${widget.coffeeMenuTerima.price}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Ingredients           : ${widget.coffeeMenuTerima.ingredients[0]}, ${widget.coffeeMenuTerima.ingredients[1]}, ${widget.coffeeMenuTerima.ingredients[2]}, ${widget.coffeeMenuTerima.ingredients[3]}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Nutrition                : ${widget.coffeeMenuTerima.nutrition}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Review Avarage   : ${widget.coffeeMenuTerima.reviewAverage}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Review Count       : ${widget.coffeeMenuTerima.reviewCount}"),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 35,
                  width: 1300,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      minimumSize: const Size.fromHeight(20),
                    ),
                    onPressed: () {
                      _launchURL(widget.coffeeMenuTerima.linkStore);
                    },
                    child: const Text('Go to Store'),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
