class Api {
  final String image;

  Api({
    required this.image,
  });

  factory Api.fromMaptoImageObject({required Map data}) {
    return Api(image: data['largeImageURL']);
  }
}
