library flutter_auto_export;

import 'package:build/build.dart';
import 'src/ExporterGeneratorBuilder.dart';
import 'src/ExportsBuilder.dart';

export 'package:flutter_auto_export/src/AutoExporter.dart';

// ignore: public_member_api_docs
const version = '1.0.2';

// ignore: public_member_api_docs
Builder exporterGeneratorBuilder(BuilderOptions options) {
  return ExporterGeneratorBuilder();
}

// ignore: public_member_api_docs
Builder exportsBuilder(BuilderOptions options) {
  return ExportsBuilder();
}
