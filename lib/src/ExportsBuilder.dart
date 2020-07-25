import 'dart:async';
import 'package:glob/glob.dart';
import 'package:build/build.dart';

// ignore: public_member_api_docs
class ExportsBuilder implements Builder {
  @override
  // ignore: type_annotate_public_apis
  final buildExtensions = const {
    r'$lib$': ['auto_export.dart']
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final exports = buildStep.findAssets(Glob('**/*.exports'));
    final content = [
      "// GENERATED CODE - DO NOT MODIFY BY HAND",
      "",
      await for (var exportLibrary in exports)
        "export '${exportLibrary.changeExtension('.dart').uri}';",
    ];
    if (content.isNotEmpty) {
      await buildStep.writeAsString(
          AssetId(buildStep.inputId.package, 'lib/auto_export.dart'),
          content.join('\n'));
    }
  }
}
