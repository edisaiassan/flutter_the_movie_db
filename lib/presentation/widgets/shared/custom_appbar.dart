import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SliverAppBar(
      floating: true,
      leading: Icon(Icons.movie_outlined, color: colors.primary),
      title: const Text('The Fluvie DB'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
