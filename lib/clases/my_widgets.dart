import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  final String titulo = "Widgets Flutter";

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    //bool isAndroid = Platform.isAndroid;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          actions: const [FlutterLogo()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        /* body: const Column(
          children: [
            Text(
              "Texto de ejemplo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
                color: Color(0xFFFF9005),
              ),
            ),
            Text(
              "Texto de ejemplo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ],
        ), */
        /* body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                left: 16,
                bottom: isAndroid ? 16 : 50,
                child: myButtonFloating(),
              ),
            ],
          ),
        ), */
        body: const MisWidgets(),
      ),
    );
  }

  Widget myButtonFloating() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}

// FloatingActionButtonPersonalizado
Widget myButtonFloating() {
  return FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  );
}

class MisWidgets extends StatelessWidget {
  const MisWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Mis Widgets Básicos"),
        Wrap(
          spacing: 8,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("ElevatedButton"),
            ),
            const SizedBox(
              width: 8,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("OutlinedButton"),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
          ],
        ),
        Container(
          color: Colors.yellow,
          width: 200,
          height: 180,
          child: Image.network(
            "https://storage.googleapis.com/cms-storage-bucket/d83012c34a8f88a64e2b.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.yellow,
          width: 200,
          height: 180,
          child: Image.asset(
            "assets/img/bird.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: GestureDetector(
            onTap: () => print("Se presiona el boton"),
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("ElevatedButton"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("OutlinedButton"),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
          ],
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
