import 'package:flutter/material.dart';
import 'package:labil_video_editing/features/editor/presentation/video_editor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('narakisah'),
        backgroundColor: Colors.black,

      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoEditorScreen(),
                  )
              );
            },
            child: Text('Proyek Baru'),
        ),
      ),
    );
  }
}
