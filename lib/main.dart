import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/util/max_width_box.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  /// The route configuration.
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'page1',
            builder: (BuildContext context, GoRouterState state) {
              return const Page1();
            },
          ),
        ],
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const transitionType = ContainerTransitionType.fadeThrough;

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: OpenContainerWidget(
                transitionType: transitionType,
                path: 'page1',
                object: Page1(),
                icon: Icons.add,
                height: 50,
                width: 50,
                size: 30,
                radius: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaxWidthBox(
          maxWidth: 800,
          child: Container(
            color: Colors.white,
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'back',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OpenContainerWidget extends StatelessWidget {
  const OpenContainerWidget({
    super.key,
    required this.transitionType,
    required this.path,
    required this.object,
    this.text,
    this.icon,
    required this.width,
    required this.height,
    required this.size,
    required this.radius,
  });

  final ContainerTransitionType transitionType;
  final String path;
  final Widget object;
  final String? text;
  final IconData? icon;
  final double width;
  final double height;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, VoidCallback closeContainer) {
        return object;
      },
      closedBuilder: (context, VoidCallback openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.white),
            width: width,
            height: height,
            child: Center(
              child: Icon(
                icon!,
                size: size,
                color: Colors.black87,
              ),
            ),
          ),
        );
      },
      closedColor: Colors.white,
      openColor: Colors.white,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      transitionType: transitionType,
      transitionDuration: const Duration(milliseconds: 600),
      routeSettings: RouteSettings(name: path),
    );
  }
}
