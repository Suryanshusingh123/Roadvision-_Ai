import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? video;
  VideoPlayerController? videocontroller;
  Future<void> pickvideofromgallery() async {
    final videopicked =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (videopicked != null) {
      video = File(videopicked.path);
      videocontroller = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          setState(() {});
          videocontroller!.play();
          videocontroller!.setLooping(true);
        });
    }
  }

  Future<void> pickvideofromcamera() async {
    final videopicked = await ImagePicker().pickVideo(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        maxDuration: const Duration(seconds: 60));
    if (videopicked != null) {
      video = File(videopicked.path);
      videocontroller = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          setState(() {});
          videocontroller!.play();
          videocontroller!.setLooping(true);
        });
    }
  }

  @override
  void dispose() {
    videocontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            video == null
                ? const SizedBox(
                    height: 400,
                    width: 300,
                    child: Placeholder(),
                  )
                : ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 400, maxWidth: 300),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        videocontroller!.value.isPlaying
                            ? videocontroller!.pause()
                            : videocontroller!.play();
                      },
                      child: AspectRatio(
                        aspectRatio: videocontroller!.value.aspectRatio,
                        child: Stack(children: [
                          VideoPlayer(videocontroller!),
                          Center(
                              child: videocontroller!.value.isPlaying
                                  ? const SizedBox()
                                  : SizedBox.square(
                                      dimension: 100,
                                      child:
                                          Image.asset('images/playicon.png')))
                        ]),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () => pickvideofromgallery(),
                style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(Size(220, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                         MaterialStatePropertyAll(Colors.blueAccent.shade700)),
                icon: SizedBox.square(
                  dimension: 35,
                  child: Image.asset('images/video.png'),
                ),
                label: const Text(
                  'Pick Video',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () => pickvideofromcamera(),
                style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(Size(220, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:  MaterialStatePropertyAll(
                        Colors.blueAccent.shade700)),
                icon: SizedBox.square(
                  dimension: 35,
                  child: Image.asset('images/camera.png'),
                ),
                label: const Text(
                  'Record Video',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
                )),
          ],
        )));
  }
}
