import 'package:flutter/material.dart';

class ImageApi extends StatelessWidget {
  const ImageApi(
    this.url, {
    this.width,
    this.height,
    this.fit,
    this.errorImage,
    super.key,
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? errorImage;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return const Text('Img error...');
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: CircularProgressIndicator.adaptive(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
