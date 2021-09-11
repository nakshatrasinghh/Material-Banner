import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: showBanner,
        child: const Text('Show Banner', style: TextStyle(fontSize: 20)),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            primary: Colors.indigo,
            textStyle: const TextStyle(fontSize: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }

  void showBanner() => ScaffoldMessenger.of(context)
    ..removeCurrentMaterialBanner()
    ..showMaterialBanner(MaterialBanner(
        backgroundColor: Colors.pinkAccent.withOpacity(0.9),
        leading: const Icon(
          Icons.info,
          size: 30,
          color: Colors.black,
        ),
        leadingPadding: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        contentTextStyle: const TextStyle(fontSize: 18),
        content: const Text(
          'Material Banner Widget',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          TextButton(
              onPressed: () => showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text('Alert Dialog'),
                      titlePadding: EdgeInsets.all(10),
                      insetPadding: EdgeInsets.all(10),
                      content: Text('Added item successfully'),
                    ),
                  ),
              child: const Text(
                'ADD',
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
          TextButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
              child: const Text(
                'DISMISS',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ))
        ]));
}
