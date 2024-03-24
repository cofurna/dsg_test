import 'package:dsg_test/components/painters/gird_painter.dart';
import 'package:dsg_test/core/extensions/context_ext.dart';
import 'package:dsg_test/features/painter/app_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.grey200,
      body: Stack(
        children: [
          CustomPaint(
            painter: GridPainter(),
            child: Container(),
          ),
          const ProviderScope(
            child: AppPainter(),
          ),
        ],
      ),
    );
  }
}
