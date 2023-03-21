import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final VoidCallback onPressed;

  const FavoriteButton({required this.onPressed});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavoriteButton = false;

  void _toggleFavorite() {
    setState(() {
      _isFavoriteButton = !_isFavoriteButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isFavoriteButton
          ? Icon(Icons.favorite, color: Colors.pink)
          : Icon(Icons.favorite_border),
      onPressed: () {
        _toggleFavorite();
        widget.onPressed();
      },
    );
  }
}
