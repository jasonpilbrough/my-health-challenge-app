import 'data_mapper.dart';

abstract class BaseDataMapper<T, S> implements DataMapper<T, S> {
  List<T> mapList(List<S> entities) =>
      entities.map((entity) => map(entity)).toList();
}
