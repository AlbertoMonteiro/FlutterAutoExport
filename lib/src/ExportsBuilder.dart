import 'dart:async';
import 'package:glob/glob.dart';
import 'package:build/build.dart';

class ExportsBuilder implements Builder {
  @override
  final buildExtensions = const {
    r'$lib$': ['auto_export.dart']
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final exports = buildStep.findAssets(Glob('**/*.exports'));
    final content = [
      await for (var exportLibrary in exports)
        "export '${exportLibrary.changeExtension('.dart').uri}';",
    ];
    if (content.isNotEmpty) {
      buildStep.writeAsString(
          AssetId(buildStep.inputId.package, 'lib/auto_export.dart'),
          content.join('\n'));
    }
  }
}
