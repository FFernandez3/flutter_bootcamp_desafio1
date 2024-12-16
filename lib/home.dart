import 'package:desafio1/animal_detail.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF395253),
        appBar: AppBar(
          backgroundColor: const Color(0xFF395253),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const DeepGreenRect(),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Discover',
                      style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Our majestic world together',
                      style: TextStyle(
                        color: Colors.white12,
                        fontSize: 20,
                      ),
                    ),
                    // Carrusel
                    Expanded(
                      child: AnimalCarousel(),
                    ),
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

class AnimalCarousel extends StatelessWidget {
  final List<Animal> animals = [
    Animal(
      name: 'Gato',
      image: 'assets/img/cat.jpg',
      imageCartoon: 'assets/img/cat_2.png',
      description:
          'Los gatos pasan la mitad de su día durmiendo y son muy ágiles porque tienen un esqueleto flexible. Pueden saltar hasta seis veces su altura.',
      sound: 'assets/mp3/cat.mp3',
      species: 37,
    ),
    Animal(
      name: 'Perro',
      image: 'assets/img/dog.jpg',
      imageCartoon: 'assets/img/dog_2.png',
      description:
          'Los perros tienen un súper olfato, ¡pueden oler hasta 100.000 veces mejor que los humanos! Por eso, muchas veces ayudan a encontrar cosas o personas.',
      sound: 'assets/mp3/dog.mp3',
      species: 42,
    ),
    Animal(
      name: 'Pajaro',
      image: 'assets/img/bird.jpg',
      imageCartoon: 'assets/img/bird_2.png',
      description:
          'Los pájaros son los únicos animales con plumas, ¡y algunas especies pueden volar a más de 100 km/h! Además, usan sus cantos para hablar entre ellos o para llamar la atención de otros pájaros.',
      sound: 'assets/mp3/bird.mp3',
      species: 55,
    ),
    Animal(
      name: 'Caballo',
      image: 'assets/img/horse.jpg',
      imageCartoon: 'assets/img/horse_2.png',
      description:
          'Los caballos pueden dormir de pie gracias a sus patas fuertes, y tienen una excelente memoria. Pueden reconocer amigos humanos después de muchos años.',
      sound: 'assets/mp3/horse.mp3',
      species: 28,
    ),
    Animal(
      name: 'Vaca',
      image: 'assets/img/cow.jpg',
      imageCartoon: 'assets/img/cow_2.png',
      description:
          'Las vacas tienen cuatro estómagos que les ayudan a digerir el pasto. También tienen muy buena memoria, recuerdan caras y lugares por mucho tiempo.',
      sound: 'assets/mp3/cow.mp3',
      species: 9,
    ),
    Animal(
      name: 'Gallo',
      image: 'assets/img/rooster.jpg',
      imageCartoon: 'assets/img/rooster_2.png',
      description:
          ' Los gallos cantan para marcar su territorio y avisar a otros que están ahí. Su canto puede escucharse desde muy lejos, ¡incluso a 1 km de distancia!',
      sound: 'assets/mp3/rooster.mp3',
      species: 10,
    ),
    Animal(
      name: 'Leon',
      image: 'assets/img/lion.jpg',
      imageCartoon: 'assets/img/lion_2.png',
      description:
          'Los leones son conocidos como los "reyes de la selva" y su rugido puede escucharse hasta a 8 kilómetros. Las hembras son las que cazan para alimentar a toda la familia.',
      sound: 'assets/mp3/lion.mp3',
      species: 3,
    ),
  ];

  AnimalCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PageView.builder(
        itemCount: animals.length,
        padEnds: false,
        physics: const BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.58),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  height: size.height * 0.4,
                  width: size.width * 1.1,
                  child: AnimalCard(animal: animal),
                ),
              ),
            ],
          );
        });
  }
}

class AnimalCard extends StatefulWidget {
  final Animal animal;

  const AnimalCard({super.key, required this.animal});

  @override
  State<AnimalCard> createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  late AudioPlayer player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAsset(widget.animal.sound);

    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void toggleAudio() {
    if (isPlaying) {
      player.pause();
    } else {
      if (player.processingState == ProcessingState.completed) {
        player.seek(Duration.zero);
      }
      player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimalDetailPage(
                name: widget.animal.name,
                image: widget.animal.imageCartoon,
                description: widget.animal.description,
                species: widget.animal.species,
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(widget.animal.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 28,
                left: 18,
                child: Text(
                  widget.animal.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 18,
                right: 8,
                child: ElevatedButton(
                  onPressed: () {
                    toggleAudio();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      elevation: 10),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                    //player.playing ? Icons.pause : Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Animal {
  final String _name;
  final String _image;
  final String _imageCartoon;
  final String _description;
  final String _sound;
  final int _species;

  Animal(
      {required String name,
      required String image,
      required imageCartoon,
      required description,
      required String sound,
      required int species})
      : _name = name,
        _image = image,
        _sound = sound,
        _imageCartoon = imageCartoon,
        _description = description,
        _species = species;

  get name => _name;
  get image => _image;
  get imageCartoon => _imageCartoon;
  get sound => _sound;
  get description => _description;
  get species => _species;
}

class DeepGreenRect extends StatelessWidget {
  const DeepGreenRect({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      left: 0,
      top: size.height * 0.28,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(right: 20.0),
        width: size.width * 0.86,
        decoration: const BoxDecoration(
          color: Color(0xFF314748),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(0),
          ),
        ),
      ),
    );
  }
}
