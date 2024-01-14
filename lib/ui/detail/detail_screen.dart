import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Flutter code sample for [Hero].

void main() {
  // timeDilation 히어로 애니메이션 효과 시간 주기
  timeDilation = 12.0;
  runApp(const HeroApp());
}

class HeroApp extends StatelessWidget {
  const HeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HeroExample(),
    );
  }
}

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero animations')),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Hero(
              tag: 'hero-default-tween',
              child: GestureDetector(
                onTap:() => _gotoDetailsPage(context),
                child: BoxWidget(
                  size: const Size(50.0, 50.0),
                  color: Colors.orange[700]!.withOpacity(0.5),
                ),
              ),
            ),
            title: const Text(
              '히어로 애니메이션 ',
            ),
          ),
          const SizedBox(height: 10.0),
          ListTile(
            leading: Hero(
              tag: 'hero-custom-tween',
              createRectTween: (Rect? begin, Rect? end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              child: GestureDetector(
                onTap:() => _gotoDetailsPage(context),
                child: BoxWidget(
                  size: const Size(50.0, 50.0),
                  color: Colors.green[700]!.withOpacity(0.5),
                ),
              ),
            ),
            title: const Text(
              '다음 화면으로 이동된다.',
            ),
          ),

        ],
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Align(
          alignment: Alignment.bottomRight,
          child: Stack(
            children: <Widget>[
              Hero(
                tag: 'hero-custom-tween',
                createRectTween: (Rect? begin, Rect? end) {
                  return MaterialRectCenterArcTween(begin: begin, end: end);
                },
                child: BoxWidget(
                  size: const Size(400.0, 400.0),
                  color: Colors.orange[700]!.withOpacity(0.5),
                ),
              ),
              Hero(
                tag: 'hero-default-tween',
                child: BoxWidget(
                  size: const Size(400.0, 400.0),
                  color: Colors.green[700]!.withOpacity(0.5),
                ),
              ),
              Text('히어로 테스트 하기!!'),
            ],
          ),
        ),
      ),
    ));
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.size,
    required this.color,
  });

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: color,
    );
  }
}
