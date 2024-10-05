enum ImageAssets {
  breakingNews('assets/breaking_news.png');

  const ImageAssets(this.path);

  final String path;
}

enum SvgAssets {
  pageNotFound('assets/404.svg');

  const SvgAssets(this.path);

  final String path;
}
