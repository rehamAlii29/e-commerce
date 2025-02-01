import 'package:equatable/equatable.dart';

class CategoryE extends Equatable {
  final int id;
  final String name;

  CategoryE({required this.id, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
