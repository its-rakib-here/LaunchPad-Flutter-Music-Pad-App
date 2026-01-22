import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "LaunchPad",
              style: GoogleFonts.orbitron(color: Colors.white),
            ),
            // centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              Pad(Color(0xFFADCBFC), Color(0xFF067CD), "1.mp3"), // Blue
              Pad(Color(0xFFFFD6A5), Color(0xFFFF9F1C), "2.mp3"), // Orange
              Pad(Color(0xFFB7E4C7), Color(0xFF2D6A4F), "3.mp3"), // Green
              Pad(Color(0xFFFBC4AB), Color(0xFFE36414), "4.mp3"), // Peach
              Pad(Color(0xFFADCBFC), Color(0xFF067CD), "5.mp3"), // Blue
              Pad(Color(0xFFFFD6A5), Color(0xFFFF9F1C), "6.mp3"), // Orange
              Pad(Color(0xFFB7E4C7), Color(0xFF2D6A4F), "7.mp3"), // Green
              Pad(Color(0xFFFBC4AB), Color(0xFFE36414), "8.mp3"), // Peach
              Pad(Color(0xFFADCBFC), Color(0xFF067CD), "9.mp3"), // Blue
              Pad(Color(0xFFFFD6A5), Color(0xFFFF9F1C), "10.mp3"), // Orange
              Pad(Color(0xFFB7E4C7), Color(0xFF2D6A4F), "11.mp3"), // Green
              Pad(Color(0xFFFBC4AB), Color(0xFFE36414), "12.mp3"), // Peach
              Pad(Color(0xFFADCBFC), Color(0xFF067CD), "13.mp3"), // Blue
              Pad(Color(0xFFFFD6A5), Color(0xFFFF9F1C), "14.mp3"), // Orange
              Pad(Color(0xFFB7E4C7), Color(0xFF2D6A4F), "15.mp3"), // Green
              Pad(Color(0xFFFBC4AB), Color(0xFFE36414), "16.mp3"), // Peach
              Pad(Color(0xFFADCBFC), Color(0xFF067CD), "17.mp3"), // Blue
              Pad(Color(0xFFFFD6A5), Color(0xFFFF9F1C), "18.mp3"), // Orange
              Pad(Color(0xFFB7E4C7), Color(0xFF2D6A4F), "19.mp3"), // Green
              Pad(Color(0xFFFBC4AB), Color(0xFFE36414), "20.wav"), // Peach
              Pad(Color(0xFFADCBFC), Color(0xFF067CD), "21.mp3"), // Blue
              Pad(Color(0xFFFFD6A5), Color(0xFFFF9F1C), "22.wav"), // Orange
              Pad(Color(0xFFB7E4C7), Color(0xFF2D6A4F), "23.wav"), // Green
              Pad(Color(0xFFFBC4AB), Color(0xFFE36414), "24.wav"), // Peach
              Pad(Color(0xFFADCBFC), Color(0xFF067CD), "25.wav"), // Blue
              Pad(Color(0xFFFFD6A5), Color(0xFFFF9F1C), "26.wav"), // Orange
              Pad(Color(0xFFB7E4C7), Color(0xFF2D6A4F), "27.wav"), // Green
              Pad(Color(0xFFFBC4AB), Color(0xFFE36414), "28.wav"), // Peach

        
        
            ],
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  final Color colorCenter;
  final Color colorOutline;
  final String note;

  const Pad(this.colorCenter, this.colorOutline, this.note, {Key? key})
      : super(key: key);

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorOutline;
  late Color _colorCenter;

  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _colorCenter = widget.colorCenter;
    _colorOutline = widget.colorOutline;
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;
        });

        await Future.delayed(const Duration(milliseconds: 200));
        setState(() {
          _colorOutline = widget.colorOutline;
          _colorCenter = widget.colorCenter;
        });

        // ✅ play audio (asset)
        await player.play(AssetSource(widget.note));
      },
      child: Container(
        height: height/8.2,
        width: width/4.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: RadialGradient(
            colors: [_colorCenter, _colorOutline],
            radius: 0.5,
          ),
          boxShadow: const [BoxShadow(color: Colors.pink, blurRadius: 5.0)],
        ),
      ),
    );
  }
}