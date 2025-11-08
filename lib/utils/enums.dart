import 'package:gopher/utils/assets.dart';

enum ServiceType {
  professional(PngAssets.professional),
  gopher(PngAssets.gopher);

  final String asset;

  const ServiceType(this.asset);
}

enum GopherType {
  rider(PngAssets.rider),
  delivery(PngAssets.delivery);

  final String asset;

  const GopherType(this.asset);
}
