import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * .45;

    return Scaffold(
      backgroundColor: const Color(0xFF13122B),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Recently Played",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width,
              height: imgHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/img/ts.jfif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            songInfo(),
            audioControls(size),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF302F42),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lyrics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.open_in_new_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Icon(
                              Icons.open_in_full_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Midnight",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    const Text(
                      "You come and pick me up, no headlights",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Long drive",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Text(
                      "You come and pick me up, no headlights",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  songInfo() {
    return Container(
      height: 40,
    );
  }

  audioControls(Size size) {
    double percentage = size.width * .4;

    timeSlider() {
      return SizedBox(
        width: size.width,
        height: 10,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              width: size.width,
              height: 4,
              color: Colors.white,
            ),
            Container(
              width: percentage,
              height: 4,
              color: const Color(0xFF643CEB),
            ),
            Positioned(
              left: percentage,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFF643CEB),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Column(
          children: [
            timeSlider(),
            //Minutos
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0:30",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "-2:48",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        //Controles
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.shuffle,
              color: Colors.white,
              size: 28,
            ),
            IconButton(
              onPressed: () {
                player.stop();
              },
              icon: const Icon(
                Icons.skip_previous_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF643CEB),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () async {
                  player.setAsset('assets/song.mp3');
                  player.play();
                },
                icon: const Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.skip_next_rounded,
              color: Colors.white,
              size: 28,
            ),
            const Icon(
              Icons.repeat,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ],
    );
  }
}

// Azul (fondo)   : 13122B
// Morado / lila  : 643CEB
// gris (lyric)   : 302F42





