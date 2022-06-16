import 'package:book_exchange/screens/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(155, 96, 220, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // most popular
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Most Popular'),
                          TextButton(
                            onPressed: () {},
                            child: const Text('View all ->'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/viewBook');
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/It_Ends_With_Us.webp',
                                  height: 150,
                                  width: 100,
                                ),
                                const Text('It Ends With Us'),
                                const Text('Colleen Hoover')
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/Anka_Kuşu.jpeg',
                                  height: 150,
                                  width: 100,
                                ),
                                const Text('Anka Kuşu'),
                                const Text('Yılmaz Özdil')
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/A_Magic_Steeped_in_Poison.jpg',
                                  height: 150,
                                  width: 100,
                                ),
                                const Text('A Magic Stee...'),
                                const Text('Judy I. Lin')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              // new releases
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('New Releases'),
                          TextButton(
                            onPressed: () {},
                            child: const Text('View all ->'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/Taksiii.jpg',
                                  height: 150,
                                  width: 100,
                                ),
                                const Text('Taksiii'),
                                const Text('Ayşe Kulin')
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/This_Time_Tomorrow.jpeg',
                                  height: 150,
                                  width: 100,
                                ),
                                const Text('This Time Tomorrow'),
                                const Text('Emma Straub')
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/Trust.jpg',
                                  height: 150,
                                  width: 100,
                                ),
                                const Text('Trust'),
                                const Text('Hernan Diaz')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
