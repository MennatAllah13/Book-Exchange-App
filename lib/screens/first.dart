import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const SizedBox(
            //   height: 50,
            // ),
            const Text(
              'Book Share',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            const Text(
              '"I am a reader, I would like to help other readers by lending my own books to them"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 2,
                //fontStyle: FontStyle.italic,
              ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Column(
                children: const [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '   AGREE   ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(155, 96, 220, 1),
                ),
                shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
