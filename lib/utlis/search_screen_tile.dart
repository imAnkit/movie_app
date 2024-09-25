import 'package:flutter/material.dart';

class SearchScreenTile extends StatelessWidget {
  final dynamic movie;
  const SearchScreenTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: movie['image'] != null
                ? Image.network(
                    movie['image']['medium'],
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 100,
                    height: 120,
                    color: Colors.grey,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.red,
                    )),
                  ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie['name'] ?? 'Unknown Title',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movie['summary'] != null
                      ? movie['summary']
                          .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '')
                      : 'No summary available',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
