import 'package:flutter/material.dart';

class CircleImg extends StatelessWidget {
  const CircleImg({
    Key? key,
    required this.url,
    required this.lastSeen,
  }) : super(key: key);

  final String url;
  final int lastSeen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url),
            ),
          ),
        ),
        lastSeen <= 60
            ? Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 14,
                  width: lastSeen != 0 ? 30 : 14,
                  decoration: BoxDecoration(
                    color: lastSeen != 0
                        ? Colors.green.withOpacity(.2)
                        : Colors.green,
                    shape: lastSeen != 0 ? BoxShape.rectangle : BoxShape.circle,
                    borderRadius:
                        lastSeen != 0 ? BorderRadius.circular(12) : null,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 0,
                        spreadRadius: 3,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: lastSeen != 0
                      ? Center(
                          child: Text(
                            '${lastSeen}m',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : null,
                ),
              )
            : Container(),
      ],
    );
  }
}
