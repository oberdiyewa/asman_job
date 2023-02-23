import 'package:flutter/material.dart';

class JobRefreshButton extends StatelessWidget {
  const JobRefreshButton({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.refresh,
          ),
        ),
      ),
    );
  }
}
