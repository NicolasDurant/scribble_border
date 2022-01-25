# Cookbook

All the snippets are from the [example project](https://github.com/NicolasDurant/scribble_border/tree/master/example).

## Usage
### Preview
![Example](https://github.com/NicolasDurant/scribble_border/blob/master/example/assets/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-25%20at%2017.13.18square.png)
### Code
```dart
import 'package:flutter/material.dart';
import 'package:scribble_border/scribble_border.dart';

class Example extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScribbleBorder(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
```
### Preview
|![Example1](https://github.com/NicolasDurant/scribble_border/blob/master/example/assets/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-25%20at%2016.57.20.png)|![Example2](https://github.com/NicolasDurant/scribble_border/blob/master/example/assets/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-25%20at%2016.57.13.png) | ![Example3](https://github.com/NicolasDurant/scribble_border/blob/master/example/assets/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202022-01-25%20at%2017.06.15.png)|
|:---:|:---:|:---:|
### Code
Code found under [Example](https://github.com/NicolasDurant/scribble_border/tree/master/example/main.dart).
```dart
import 'package:flutter/material.dart';
import 'package:scribble_border/scribble_border.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final exampleList = List.generate(20, (index) => Text(index.toString()));
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scribble Border',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Wrap any widget with a border',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScribbleBorder(
                  gradientStretch: 0.0,
                  strokeWidth: 2,
                  child: Container(
                    child: TextButton(
                      child: const Text('Button'),
                      onPressed: null,
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  ),
                ),
                ScribbleBorder(
                  strokeWidth: 2,
                  padding: 4,
                  child: Container(
                    width: 100,
                    child: const Image(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                ),
                ScribbleBorder(
                  strokeWidth: 2,
                  padding: 4,
                  child: const Icon(Icons.home_outlined),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'With random offset',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScribbleBorder(
                  strokeWidth: 2,
                  randomOffset: 4,
                  child: Container(
                    child: TextButton(
                      child: const Text('randomOffset: 4'),
                      onPressed: null,
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  ),
                ),
                ScribbleBorder(
                  strokeWidth: 2,
                  padding: 4,
                  randomOffset: 4,
                  child: Container(
                    width: 100,
                    child: const Image(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                ),
                ScribbleBorder(
                  strokeWidth: 2,
                  randomOffset: 4,
                  padding: 4,
                  child: const Icon(Icons.home_outlined),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'With different gradients, gradient stretch and stroke sizes',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScribbleBorder(
                  strokeWidth: 2,
                  gradientStretch: 0.0,
                  gradient: const LinearGradient(colors: [Colors.blue, Colors.red]),
                  child: Container(
                    child: TextButton(
                      child: const Text('linear gradient'),
                      onPressed: null,
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  ),
                ),
                ScribbleBorder(
                  strokeWidth: 4,
                  padding: 4,
                  child: Container(
                    width: 100,
                    child: const Image(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                ),
                ScribbleBorder(
                  strokeWidth: 2,
                  gradientStretch: 0.8,
                  gradient: const LinearGradient(colors: [Colors.blue, Colors.red]),
                  child: const Icon(Icons.home_outlined),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Circular',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScribbleBorder(
                  circular: true,
                  strokeWidth: 2,
                  gradientStretch: 0.0,
                  gradient: const LinearGradient(colors: [Colors.blue, Colors.red]),
                  child: Container(
                    child: TextButton(
                      child: const Text('c'),
                      onPressed: null,
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  ),
                ),
                ScribbleBorder(
                  strokeWidth: 4,
                  padding: 25,
                  circular: true,
                  child: Container(
                    width: 100,
                    child: const Image(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                ),
                ScribbleBorder(
                  circular: true,
                  strokeWidth: 2,
                  gradientStretch: 0.8,
                  gradient: const LinearGradient(colors: [Colors.blue, Colors.red]),
                  child: const Icon(Icons.home_outlined),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'With the background paint class',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackgroundPaint(
                  corners: Corners.all(0),
                  child: ScribbleBorder(
                    child: Container(
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                BackgroundPaint(
                  corners: Corners.all(100),
                  child: ScribbleBorder(
                    circular: true,
                    child: Container(
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                BackgroundPaint(
                  corners: Corners.all(100),
                  child: ScribbleBorder(
                    child: Container(
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Add "hand-drawn" errors',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackgroundPaint(
                  corners: Corners.all(5),
                  randomRadius: 15,
                  randomOffset: 5,
                  gradient: const RadialGradient(
                    colors: [
                      Color.fromARGB(200, 255, 238, 88),
                      Color.fromARGB(255, 255, 241, 118),
                    ],
                  ),
                  child: ScribbleBorder(
                    randomOffset: 4,
                    gradientStretch: 0.25,
                    child: Container(
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                BackgroundPaint(
                  corners: Corners.all(100),
                  randomRadius: 15,
                  randomOffset: 5,
                  child: ScribbleBorder(
                    circular: true,
                    circularRadius: 49,
                    randomOffset: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                BackgroundPaint(
                  randomRadius: 200,
                  randomOffset: 0,
                  gradient: const RadialGradient(
                    colors: [
                      Color.fromARGB(200, 128, 91, 158),
                      Color.fromARGB(255, 128, 91, 158),
                    ],
                  ),
                  corners: Corners.all(100),
                  child: ScribbleBorder(
                    randomOffset: 2,
                    gradientStretch: 0.25,
                    child: Container(
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Make unique cartoony grids',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 12,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: exampleList
                  .map((item) => BackgroundPaint(
                        corners: Corners.all(5),
                        randomRadius: 15,
                        randomOffset: 2,
                        child: ScribbleBorder(
                          randomOffset: 4,
                          gradientStretch: 0.25,
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: item,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
```
