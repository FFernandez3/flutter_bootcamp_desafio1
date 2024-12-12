import 'package:flutter/material.dart';

class GaleriaImagenesPage extends StatefulWidget {
  const GaleriaImagenesPage({super.key});

  @override
  State<GaleriaImagenesPage> createState() => _GaleriaImagenesPageState();
}

class _GaleriaImagenesPageState extends State<GaleriaImagenesPage> {
  final List<String> imgUrls = [
    "https://placecats.com/300/201",
    "https://placecats.com/300/202",
  ];

  int numberColumn = 2;

  addImage() {
    int lastIndex = int.parse(imgUrls.last.split("/")[4]);
    setState(() {
      imgUrls.add("https://placecats.com/300/${lastIndex + 1}");
    });
  }

  changeView(int number) {
    setState(() {
      numberColumn = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF275846),
      body: Column(
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: headerSection(context),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SizedBox(
              width: size.width,
              child: textSection(),
            ),
          ),
          const SizedBox(height: 36),
          bodySection(),
        ],
      ),
    );
  }

  Widget headerSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 38,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white38,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: addImage,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget textSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image Gallery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "Created 2 days ago",
          style: TextStyle(
            color: Colors.white60,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget bodySection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recently Added",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => changeView(2),
                      icon: const Icon(Icons.grid_view),
                      color: numberColumn == 2 ? Colors.blue : Colors.grey,
                    ),
                    IconButton(
                      onPressed: () => changeView(3),
                      icon: const Icon(Icons.grid_on_sharp),
                      color: numberColumn == 3 ? Colors.blue : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numberColumn,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: imgUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  String url = imgUrls[index];
                  return Hero(
                    tag: index,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageView(
                              imgUrl: url,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(url),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Mini App de imagenes

// Ejercicio 1:

// - Agregar las imagenes (que sean visibles)
// - Que las imagenes tengan el borde redondeado
// - Que aparezca en la galeria, la imagen agregada desde el boton
// del AppBar

// Ejercicio 2:

// - Modificar la cantidad de elementos en la grilla
// - Ver la imagen (que se haga clic)
// Dialog
// Navigator (fullscreen)

class ImageView extends StatelessWidget {
  final String imgUrl;
  final int index;

  const ImageView({
    super.key,
    required this.imgUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: index,
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}







