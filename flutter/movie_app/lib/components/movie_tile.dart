import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rate;

  const MovieTile({
    Key? key,
    required this.imageUrl,
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
            child: Image.network(
              imageUrl,
              width: 210,
              height: 310,
              fit: BoxFit.cover,
            ),
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
