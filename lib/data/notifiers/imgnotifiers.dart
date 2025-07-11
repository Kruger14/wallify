import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallify/data/models/wallposters.dart' show Wallposters;
import 'package:wallify/data/services/imageservice.dart';

class Imagenotifiers extends FamilyAsyncNotifier<List<Wallposters>, String> {
  late final String category;
  late final ImageService _repo;

  final List<Wallposters> _images = [];
  int _page = 0;
  final int _pageSize = 10;
  bool _hasMore = true;
  bool _isFetching = false;

  bool get hasMore => _hasMore;

  @override
  Future<List<Wallposters>> build(String categoryArg) async {
    category = categoryArg;
    _repo = ImageService();
    return await _fetchInitialImages();
  }

  Future<List<Wallposters>> _fetchInitialImages() async {
    try {
      final newItems = await _repo.fetchImages(
        limit: _pageSize,
        offset: _page * _pageSize, category: category,
      );
      _page++;
      _hasMore = newItems.length == _pageSize;
      _images.addAll(newItems);
      return [..._images];
    } catch (e, st) {
      throw AsyncError(e, st);
    }
  }

  Future<void> fetchNextPage({required String category}) async {
    if (!_hasMore || _isFetching) return;
    _isFetching = true;
    try {
      final newItems = await _repo.fetchImages(
        limit: _pageSize,
        offset: _page * _pageSize, category: category,
      );
      _page++;
      if (newItems.length < _pageSize) _hasMore = false;
      _images.addAll(newItems);
      state = AsyncData([..._images]);
    } catch (e, st) {
      state = AsyncError(e, st);
    } finally {
      _isFetching = false;
    }
  }

  Future<void> refreshImages() async {
    _page = 0;
    _hasMore = true;
    _images.clear();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _fetchInitialImages());
  }
}


final imagenotifierProvider =
    AsyncNotifierProvider.family<Imagenotifiers, List<Wallposters>, String>(
  Imagenotifiers.new,
);
