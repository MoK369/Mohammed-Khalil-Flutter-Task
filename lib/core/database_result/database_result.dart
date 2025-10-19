sealed class DatabaseResult<T>{}

class Success<T> extends DatabaseResult<T>{
  final T data;

  Success(this.data);
}

class Error<T> extends DatabaseResult<T>{
  Object error;

  Error(this.error);
}