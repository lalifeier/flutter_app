import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final defaultOptions = CacheOptions(
  // A default store is required for interceptor.
  store: MemCacheStore(),
  // Default.
  policy: CachePolicy.request,
  // Optional. Returns a cached response on error but for statuses 401 & 403.
  hitCacheOnErrorExcept: [401, 403],
  // Optional. Overrides any HTTP directive to delete entry past this duration.
  maxStale: const Duration(days: 7),
  // Default. Allows 3 cache sets and ease cleanup.
  priority: CachePriority.normal,
  // Default. Body and headers encryption with your own algorithm.
  cipher: null,
  // Default. Key builder to retrieve requests.
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  // Default. Allows to cache POST requests.
  // Overriding [keyBuilder] is strongly recommended.
  allowPostMethod: false,
);

Interceptor createCacheInterceptor([CacheOptions? options]) {
  options = options ?? defaultOptions;
  return DioCacheInterceptor(options: options);
}
