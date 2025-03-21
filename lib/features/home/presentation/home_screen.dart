import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)
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
            SizedBox(height: 30,),
            Text("PROYEK KAMU", style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,)
            ),
          ],
        ),
      ),
    );
  }
}
