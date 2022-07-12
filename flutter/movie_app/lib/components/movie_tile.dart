import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rate;

  const MovieTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 72),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: imagePath.contains('http')
                ? Image.network(imagePath, width: 210)
                : Image.asset(imagePath, width: 210),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_rate,
                    color: Colors.amber[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rate.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
