import 'package:asincroniaflutter/services/mockapi.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asincronia flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blueAccent[700],
          secondary: Colors.blue,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Asynchronous Flutter', textAlign: TextAlign.center)),
        ),
        body: const EstadosAsync(),
      ),
    );
  }
}

class EstadosAsync extends StatefulWidget {
  const EstadosAsync({super.key});

  @override
  State<StatefulWidget> createState() => _EstadosAsync();
}

class _EstadosAsync extends State<EstadosAsync> {
  /*Variables a utilizar*/
  int ferrari = 0,
      hyundai = 0,
      fisherPrice = 0,
      timeFerr = 0,
      timeHyu = 0,
      timeFish = 0;
  bool selected = true;
  late double widthFerr = 0,
      widthHyu = 0,
      widthFish = 0,
      heightFerr = 10,
      heightHyu = 10,
      heightFish = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /*Ferrari*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.large(
                  onPressed: () async {
                    setState(() {
                      widthFerr = 300.0;
                      heightFerr = 10.0;
                      timeFerr = 1;
                    });
                    ferrari = await MockApi().getFerrariInteger();
                    setState(() {
                      widthFerr = 0.0;
                      heightFerr = 10.0;
                      timeFerr = 0;
                    });
                  },
                  backgroundColor: Colors.green[900],
                  child: const Icon(Icons.bolt_outlined),
                ),
              ],
            ),
            AnimatedContainer(
              width: widthFerr,
              height: heightFerr,
              color: Colors.green[900],
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: timeFerr),
            ),
            Text(
              ferrari.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 31, 108, 36),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0),
            ),
            /*Hyundai*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.large(
                  onPressed: () async {
                    setState(() {
                      widthHyu = 300.0;
                      heightHyu = 10.0;
                      timeHyu = 3;
                    });
                    hyundai = await MockApi().getHyundaiInteger();
                    setState(() {
                      widthHyu = 0.0;
                      heightHyu = 10.0;
                      timeHyu = 0;
                    });
                  },
                  backgroundColor: Colors.orange[900],
                  child: const Icon(Icons.fire_truck),
                )
              ],
            ),
            AnimatedContainer(
              width: widthHyu,
              height: heightHyu,
              color: Colors.orange[900],
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: timeHyu),
            ),
            Text(
              hyundai.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 230, 81, 0),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0),
            ),
            /*FishPrice*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.large(
                  onPressed: () async {
                    setState(() {
                      widthFish = 300.0;
                      heightFish = 10.0;
                      timeFish = 9;
                    });
                    fisherPrice = await MockApi().getFisherPriceInteger();
                    setState(() {
                      widthFish = 0.0;
                      heightFish = 10.0;
                      timeFish = 0;
                    });
                  },
                  backgroundColor: Colors.red[900],
                  child: const Icon(Icons.hiking_outlined),
                )
              ],
            ),
            AnimatedContainer(
              width: widthFish,
              height: heightFish,
              color: Colors.orange[900],
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: timeFish),
            ),
            Text(
              fisherPrice.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 230, 81, 0),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0),
            ),
          ]),
    );
  }
}
