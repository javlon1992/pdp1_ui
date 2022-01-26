import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmar extends StatefulWidget {
  var child;
  Shimmar({Key? key, required this.child}) : super(key: key);

  @override
  _ShimmarState createState() => _ShimmarState();
}

class _ShimmarState extends State<Shimmar> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

          child: widget.child),
    );
  }
}