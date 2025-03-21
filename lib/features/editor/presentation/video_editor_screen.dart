import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';

class VideoEditorScreen extends StatefulWidget {
  const VideoEditorScreen({super.key});

  @override
  State<VideoEditorScreen> createState() => _VideoEditorScreenState();
}

class _VideoEditorScreenState extends State<VideoEditorScreen> {
  final ImagePicker _picker = ImagePicker();
  VideoEditorController? _videoEditorController;
  VideoPlayerController? _videoPlayerController;

  bool canShowEditor = false;
  List<String> trimmedVideos = [];
  bool isSeeking = false;

  Future<void> _pickVideo() async {
    final XFile ? file = await _picker.pickVideo(source: ImageSource.gallery);
    if (file != null) {
      _videoEditorController = VideoEditorController.file(
        File(file.path),
        minDuration: const Duration(seconds: 1),
        maxDuration: const Duration(seconds: 50),
      );
      _videoPlayerController = VideoPlayerController.file(File(file.path));
      try{
        await Future.wait([
          _videoEditorController!.initialize(),
          _videoPlayerController!.initialize(),
        ]);

        _videoPlayerController!.addListener(() {
          if(_videoPlayerController!.value.position >= _videoEditorController!.endTrim){
            _videoPlayerController!.pause();
          }
        });

        setState(() {
          canShowEditor = true;
        });
      }catch(e){
        print(e);
      }

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: Column(
          children: [
            if(canShowEditor && _videoPlayerController!.value.isInitialized && _videoEditorController!.initialized)...[
              //AREA PREVIEW VIDEO
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController!),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                          _videoPlayerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 48,
                        )
                    )
                
                  ],
                ),
              )
            ]
            else...[
            Expanded(
                child: Center(
                  child: Text("Pilih Video Dan Mulai Edit",
                  style : GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)
                  ),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: ElevatedButton(onPressed: (){
                _pickVideo();
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)
                  ),
                  child: Text("Pilih Video",
                      style : GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)
                  ),
              ),
            ),
            ]
          ],
        ),
      ),
    );
  }
}
