import 'package:book_exchange/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ViewBook extends StatelessWidget {
  /* This widget is the root
      of your application.*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book',
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(155, 96, 220, 1),
          toolbarHeight: 60,
          title: const Text('It Ends With Us'),
          centerTitle: true,
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(2.0),
          //     child: IconButton(
          //       icon: const Icon(
          //         Icons.person,
          //         color: Colors.white,
          //       ),
          //       onPressed: () {},
          //     ),
          //   ),
          // ]
        ),
        // backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/It_Ends_With_Us.webp',
                  //width: 150,
                  //height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: const Text(
                              'IT ENDS WITH US',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            'Collen Hoover',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    FavoriteWidget(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Description : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const ReadMoreText(
                      "In this \"brave and heartbreaking novel that digs its claws into you and doesn't let go, long after you've finished it\" (Anna Todd, New York Times bestselling author) from the #1 New York Times bestselling author of All Your Perfects, a workaholic with a too-good-to-be-true romance can't stop thinking about her first love. Lily hasn't always had it easy, but that's never stopped her from working hard for the life she wants. She's come a long way from the small town where she grew up--she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily's life seems too good to be true. Ryle is assertive\, stubborn, maybe even a little arrogant. He\'s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn\'t hurt. Lily can\'t get him out of her head. But Ryle\'s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his \"no dating\" rule, she can't help but wonder what made him that way in the first place. As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan--her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened. An honest, evocative, and tender novel, It Ends with Us is \"a glorious and touching read, a forever keeper. The kind of book that gets handed down\" ",
                      colorClickableText: Color.fromRGBO(155, 96, 220, 1),
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Language : ',
                          style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('English'),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          'Publication date : ',
                          style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('2 August 2016'),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          'Genre : ',
                          style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Romance novel'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          icon: (_isFavorited
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_outline)),
          color: const Color.fromRGBO(155, 96, 220, 1),
          onPressed: () {
            setState(() {
              if (_isFavorited) {
                _isFavorited = false;
              } else {
                _isFavorited = true;
              }
            });
          },
        ),
      ],
    );
  }
}
