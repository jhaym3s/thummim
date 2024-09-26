// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoursesAdapter extends TypeAdapter<Courses> {
  @override
  final int typeId = 1;

  @override
  Courses read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Courses(
      id: fields[0] as int,
      name: fields[1] as String,
      image: fields[2] as String,
      instructor: fields[3] as Instructor,
      duration: fields[4] as String,
      categories: (fields[5] as List).cast<Category>(),
      price: fields[6] as int,
      priceRendered: fields[7] as String,
      originPrice: fields[8] as dynamic,
      originPriceRendered: fields[9] as String,
      onSale: fields[10] as bool,
      salePrice: fields[11] as int,
      salePriceRendered: fields[12] as String,
      rating: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Courses obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.instructor)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.categories)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.priceRendered)
      ..writeByte(8)
      ..write(obj.originPrice)
      ..writeByte(9)
      ..write(obj.originPriceRendered)
      ..writeByte(10)
      ..write(obj.onSale)
      ..writeByte(11)
      ..write(obj.salePrice)
      ..writeByte(12)
      ..write(obj.salePriceRendered)
      ..writeByte(13)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      termId: fields[0] as int,
      name: fields[1] as String,
      slug: fields[2] as String,
      termGroup: fields[3] as int,
      termTaxonomyId: fields[4] as int,
      taxonomy: fields[5] as String,
      description: fields[6] as String,
      parent: fields[7] as int,
      count: fields[8] as int,
      filter: fields[9] as String,
      id: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.termId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.termGroup)
      ..writeByte(4)
      ..write(obj.termTaxonomyId)
      ..writeByte(5)
      ..write(obj.taxonomy)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.parent)
      ..writeByte(8)
      ..write(obj.count)
      ..writeByte(9)
      ..write(obj.filter)
      ..writeByte(10)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InstructorAdapter extends TypeAdapter<Instructor> {
  @override
  final int typeId = 3;

  @override
  Instructor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Instructor(
      avatar: fields[0] as String,
      id: fields[1] as int,
      name: fields[2] as String,
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Instructor obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.avatar)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstructorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
