import 'package:wallify/data/models/wallposters.dart';

class ImageService {
  
  final _client = Supabase.instance.client;

  Future<List<Wallposters>> fetchImages({int limit = 10, int offset = 0, required String category}) async {
    final response = await _client
        .from('imgtable')
        .select()
        .range(offset, offset + limit - 1);

    return (response as List).map((json) => Wallposters.fromJson(json)).toList();
  }
}