import 'package:flutter/material.dart';

class SwipeButton extends StatefulWidget {
  final VoidCallback onSwipeCompleted;
  final bool isLoading;
  final String text;

  const SwipeButton({
    super.key,
    required this.onSwipeCompleted,
    this.isLoading = false,
    this.text = "Swipe to Confirm",
  });

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton>
    with SingleTickerProviderStateMixin {
  double _dragValue = 0.0;
  final double _maxWidth = 300.0;
  final double _handleSize = 50.0;
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Container(
        width: _maxWidth,
        height: _handleSize + 10,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_confirmed) {
      return Container(
        width: _maxWidth,
        height: _handleSize + 10,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Icon(Icons.check, color: Colors.white, size: 30),
        ),
      );
    }

    return Container(
      width: _maxWidth,
      height: _handleSize + 10,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: _dragValue,
            top: 5,
            bottom: 5,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (_confirmed) return;
                setState(() {
                  _dragValue += details.delta.dx;
                  if (_dragValue < 0) _dragValue = 0;
                  if (_dragValue > _maxWidth - _handleSize - 10) {
                    _dragValue = _maxWidth - _handleSize - 10;
                  }
                });
              },
              onHorizontalDragEnd: (details) {
                if (_confirmed) return;
                if (_dragValue >= _maxWidth - _handleSize - 20) {
                  setState(() {
                    _confirmed = true;
                    _dragValue = _maxWidth - _handleSize - 10;
                  });
                  widget.onSwipeCompleted();
                } else {
                  setState(() {
                    _dragValue = 0;
                  });
                }
              },
              child: Container(
                width: _handleSize,
                height: _handleSize,
                margin: const EdgeInsets.only(left: 5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_right, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
