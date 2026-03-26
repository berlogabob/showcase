import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Showcase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ShowcasePage(),
    );
  }
}

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final works = [
      WorkItem(
        title: 'Terminvox',
        author: 'Andrey',
        url: 'https://berlogabob.github.io/terminvox/',
        imageAsset: 'assets/pic_termin.jpeg',
      ),
      WorkItem(
        title: 'All Eyes on You',
        author: 'Inge',
        url: 'https://editor.p5js.org/_ina.luma_/full/H38VUTeaW',
        imageAsset: 'assets/pic_allEys.jpeg',
      ),
      WorkItem(
        title: 'Patient Quilt',
        author: 'Nadine',
        url: 'https://editor.p5js.org/naydino/full/Uvk1SvGQd',
        imageAsset: 'assets/Pic-patient.jpeg',
      ),
      WorkItem(
        title: 'Ink Police',
        author: 'Nadine',
        url: 'https://editor.p5js.org/naydino/full/9Q6PxRYjE',
        imageAsset: 'assets/pic_ink.jpeg',
      ),
      WorkItem(
        title: 'Audio Engine',
        author: 'Max Cave',
        url: 'https://editor.p5js.org/naydino/full/ZMzXXFadt',
        imageAsset: 'assets/pic_audioEng.jpeg',
      ),
      WorkItem(
        title: 'Snake Agent',
        author: 'João Filipe',
        url: 'https://editor.p5js.org/naydino/full/RKH015k-5',
        imageAsset: 'assets/pic_snake.jpeg',
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 0.8,
          ),
          itemCount: works.length,
          itemBuilder: (context, index) => WorkCard(work: works[index]),
        ),
      ),
    );
  }
}

class WorkItem {
  final String title;
  final String author;
  final String url;
  final String imageAsset;

  WorkItem({
    required this.title,
    required this.author,
    required this.url,
    required this.imageAsset,
  });
}

class WorkCard extends StatefulWidget {
  final WorkItem work;

  const WorkCard({super.key, required this.work});

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered
              ? [BoxShadow(color: Colors.grey.shade300, blurRadius: 12, spreadRadius: 2)]
              : [BoxShadow(color: Colors.grey.shade100, blurRadius: 4, spreadRadius: 0)],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                widget.work.imageAsset,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.work.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E1E1E),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.work.author,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _launchUrl(widget.work.url),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _isHovered ? Colors.grey.shade100 : Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: const Text(
                            'Open',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1E1E1E),
                            ),
                          ),
                        ),
                      ),
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

  void _launchUrl(String urlString) {
    debugPrint('Opening: $urlString');
  }
}
