import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

class FoodAnnotation {
  const FoodAnnotation();
}

class FoodAnnotationGenerator extends GeneratorForAnnotation<FoodAnnotation> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    return "// Hello, Annotation ${element.name}";
  }
}

Builder foodBuilder(BuilderOptions options) =>
    SharedPartBuilder([FoodAnnotationGenerator()], "food_annotation");
