import 'package:flutter/material.dart';

class VF7ColorSelector extends StatelessWidget {
  final List<Map<String, String>> colorOptions;
  final int selectedIndex;
  final ValueChanged<int> onColorSelected;

  const VF7ColorSelector({
    super.key,
    required this.colorOptions,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Product preview section
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Stack(
            children: List.generate(colorOptions.length, (index) {
              return AnimatedOpacity(
                opacity: selectedIndex == index ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    colorOptions[index]['previewImage'] ?? '',
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        height: 200,
                        child: const Icon(Icons.error, color: Colors.grey),
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        ),
        // Color name
        Text(
          colorOptions[selectedIndex]['name'] ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        // Color selection list - căn giữa
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(colorOptions.length, (index) {
              final color = colorOptions[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () => onColorSelected(index),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedIndex == index
                            ? const Color.fromRGBO(25, 100, 243, 1)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        color['thumbnailImage'] ?? '',
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            width: 32,
                            height: 32,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 32,
                            height: 32,
                            color: Colors.grey[300],
                            child: const Icon(Icons.error, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 50),
        // Button
        SizedBox(
          width: 300,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color.fromRGBO(20, 100, 244, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'NHẬN ƯU ĐÃI',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 60),
      ],
    );
  }
}
