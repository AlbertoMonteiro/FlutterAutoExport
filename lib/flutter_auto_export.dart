library flutter_auto_export;

import 'package:build/build.dart';
import 'package:flutter_auto_export/src/ExporterGeneratorBuilder.dart';
import 'package:flutter_auto_export/src/ExportsBuilder.dart';

const version = '1.0.1';

Builder exporterGeneratorBuilder(BuilderOptions options) {
  return ExporterGeneratorBuilder();
}

Builder exportsBuilder(BuilderOptions options) {
  return ExportsBuilder();
}
