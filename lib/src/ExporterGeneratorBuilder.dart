import 'dart:async';
import 'package:flutter_auto_export/src/AutoExporter.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class ExporterGeneratorBuilder implements Builder {
  @override
  final buildExtensions = const { '.dart': ['.exports'] };

  @override
  Future<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;
    final lib = LibraryReader(await buildStep.inputLibrary);
    final exportAnnotation = TypeChecker.fromRuntime(AutoExporter);
    final annotated = [
      for (var member in lib.annotatedWith(exportAnnotation)) member.element.name,
    ];
    if (annotated.isNotEmpty) {
      buildStep.writeAsString(buildStep.inputId.changeExtension('.exports'), annotated.join(','));
    }
  }
}
