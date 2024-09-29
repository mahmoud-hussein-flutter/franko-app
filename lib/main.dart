
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

void main() {
  runApp(const Franko());
}

class Franko extends StatelessWidget {
  const Franko({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Franco App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _translatedText = '';

  String _translateToFranco(String input) {
    Map<String, String> arabicToFranco = {
      'ا': 'a',
      'ب': 'b',
      'ت': 't',
      'ث': 'th',
      'ج': 'g',
      'ح': '7',
      'خ': 'kh',
      'د': 'd',
      'ذ': 'dh',
      'ر': 'r',
      'ز': 'z',
      'س': 's',
      'ش': 'sh',
      'ص': '9',
      'ض': '9\'',
      'ط': '6',
      'ظ': '6\'',
      'ع': '3',
      'غ': '3\'',
      'ف': 'f',
      'ق': 'q',
      'ك': 'k',
      'ل': 'l',
      'م': 'm',
      'ن': 'n',
      'ه': 'h',
      'و': 'w',
      'ي': 'y',
      ' ': ' ',
      'ء': '\'',
      'ئ': '2',
      'ى': 'a',
      'ة': 'h',
      'ؤ': '2',
      'إ': '2',
      'أ': '2',
      'آ': 'aa',
      '،': ',',
      '؟': '?'
    };

    return input.split('').map((char) => arabicToFranco[char] ?? char).join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Franco',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Enter Arabic text:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Arabic Text',
                hintText: 'اكتب هنا',
                prefixIcon: Icon(Icons.text_fields),
              ),
              onChanged: (text) {
                setState(() {
                  _translatedText = _translateToFranco(text);
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Franco translation:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlue.shade50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _translatedText,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: _translatedText));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Text copied to clipboard')),
                        );
                      },
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
}
