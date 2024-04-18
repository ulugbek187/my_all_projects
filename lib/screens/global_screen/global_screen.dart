import 'package:flutter/material.dart';
import 'package:my_all_projects/main.dart';

class MyHomePageState extends State<MyHomePage> {
  List<int> tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];

  void _shuffleTiles() {
    tiles.shuffle();
    setState(() {});
  }

  void _moveTile(int index) {
    if (index - 1 >= 0 && tiles[index - 1] == 0) {
      tiles[index - 1] = tiles[index];
      tiles[index] = 0;
    } else if (index + 1 < 16 && tiles[index + 1] == 0) {
      tiles[index + 1] = tiles[index];
      tiles[index] = 0;
    } else if (index - 4 >= 0 && tiles[index - 4] == 0) {
      tiles[index - 4] = tiles[index];
      tiles[index] = 0;
    } else if (index + 4 < 16 && tiles[index + 4] == 0) {
      tiles[index + 4] = tiles[index];
      tiles[index] = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/img.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                children: List.generate(
                  16,
                  (index) {
                    return GestureDetector(
                      onTap: () => _moveTile(index),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.brown),
                        child: Center(
                          child: Text(
                            tiles[index] == 0 ? '' : tiles[index].toString(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                onPressed: _shuffleTiles,
                child: const Text(
                  'Перемешать',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
