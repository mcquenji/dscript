part of 'stdlib.dart';

/// Bindings for the HTTP standard library.
class HttpBindings extends LibraryBinding {
  /// The Dio instance used for making HTTP requests.
  ///
  /// You can override this instance to customize the HTTP client, for example, to set a base URL or interceptors.
  static Dio dio = Dio(BaseOptions(
    validateStatus: (status) => true, // Accept all status codes
  ));

  /// Bindings for the HTTP standard library.
  const HttpBindings()
      : super(
          name: 'http',
          description: 'Library for making HTTP requests.',
        );

  @override
  Set<RuntimeBinding> get bindings => {
        getBinding,
        postBinding,
        putBinding,
        deleteBinding,
        patchBinding,
        headBinding,
        optionsBinding,
      };

  /// Maps a [Dio] [Response] to it's dsl type representation.
  static Map<String, dynamic> mapResponse(Response response) {
    return {
      $Type.structKey: Struct.httpResponse.name,
      'statusCode': response.statusCode,
      'data': response.data.toString(),
      'headers': response.headers.map,
      'isRedirect': response.isRedirect,
      'statusMessage': response.statusMessage,
    };
  }

  /// Binding for making a GET request.
  static final getBinding = RuntimeBinding<HttpResponse>(
    name: 'get',
    function: (
      String path, {
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers,
    }) async {
      final response = await dio.get(
        path,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );
      return mapResponse(response);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    namedParams: {
      #queryParams: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
      #headers: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
    },
    returnType: Struct.httpResponse,
    permissions: [
      ScriptPermission.httpClient,
    ],
    description:
        'Makes a GET request to the specified [path] with optional query parameters and headers.',
  );

  /// Binding for making a POST request.
  static final postBinding = RuntimeBinding<HttpResponse>(
    name: 'post',
    function: (
      String path, {
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers,
    }) async {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );
      return mapResponse(response);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    namedParams: {
      #data: const DynamicType(),
      #queryParams: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
      #headers: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
    },
    returnType: Struct.httpResponse,
    permissions: [
      ScriptPermission.httpClient,
    ],
    description:
        'Makes a POST request to the specified [path] with optional data, query parameters, and headers.',
  );

  /// Binding for making a PUT request.
  static final putBinding = RuntimeBinding<HttpResponse>(
    name: 'put',
    function: (
      String path, {
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers,
    }) async {
      final response = await dio.put(
        path,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );
      return mapResponse(response);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    namedParams: {
      #data: const DynamicType(),
      #queryParams: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
      #headers: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
    },
    returnType: Struct.httpResponse,
    permissions: [
      ScriptPermission.httpClient,
    ],
    description:
        'Makes a PUT request to the specified [path] with optional data, query parameters, and headers.',
  );

  /// Binding for making a PATCH request.
  static final patchBinding = RuntimeBinding<HttpResponse>(
    name: 'patch',
    function: (
      String path, {
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers,
    }) async {
      final response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );
      return mapResponse(response);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    namedParams: {
      #data: const DynamicType(),
      #queryParams: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
      #headers: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
    },
    returnType: Struct.httpResponse,
    permissions: [
      ScriptPermission.httpClient,
    ],
    description:
        'Makes a PATCH request to the specified [path] with optional data, query parameters, and headers.',
  );

  /// Binding for making a DELETE request.
  static final deleteBinding = RuntimeBinding<HttpResponse>(
    name: 'delete',
    function: (
      String path, {
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers,
    }) async {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );
      return mapResponse(response);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    namedParams: {
      #data: const DynamicType(),
      #queryParams: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
      #headers: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
    },
    returnType: Struct.httpResponse,
    permissions: [
      ScriptPermission.httpClient,
    ],
    description:
        'Makes a DELETE request to the specified [path] with optional data, query parameters, and headers.',
  );

  /// Binding for making a HEAD request.
  static final headBinding = RuntimeBinding<HttpResponse>(
    name: 'head',
    function: (
      String path, {
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers,
    }) async {
      final response = await dio.head(
        path,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );
      return mapResponse(response);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    namedParams: {
      #queryParams: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
      #headers: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
    },
    returnType: Struct.httpResponse,
    permissions: [
      ScriptPermission.httpClient,
    ],
    description:
        'Makes a HEAD request to the specified [path] with optional query parameters and headers.',
  );

  /// Binding for making an OPTIONS request.
  static final optionsBinding = RuntimeBinding<HttpResponse>(
    name: 'options',
    function: (
      String path, {
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers,
    }) async {
      final response = await dio.get(
        path,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
          method: 'OPTIONS', // Set the method to OPTIONS
        ),
      );
      return mapResponse(response);
    },
    positionalParams: {
      'path': PrimitiveType.STRING,
    },
    namedParams: {
      #queryParams: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
      #headers: MapType(
        keyType: PrimitiveType.STRING,
        valueType: const DynamicType(),
      ).asNullable(),
    },
    returnType: Struct.httpResponse,
    permissions: [
      ScriptPermission.httpClient,
    ],
    description:
        'Makes an OPTIONS request to the specified [path] with optional query parameters and headers.',
  );
}

/// Typedef for the [Struct.httpResponse] type.
typedef HttpResponse = Map<String, dynamic>;
