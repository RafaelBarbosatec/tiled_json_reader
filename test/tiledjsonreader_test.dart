import 'package:flutter_test/flutter_test.dart';
import 'package:tiledjsonreader/tiledjsonreader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TiledJsonReader', () {
    test('reads a map json and resolves external json tileset', () async {
      final reader = TiledJsonReader('test/assets/mapa1.json');

      final map = await reader.read();

      expect(map.width, 50);
      expect(map.height, 50);
      expect(map.tileSets, isNotNull);
      expect(map.tileSets, hasLength(1));
      expect(map.tileSets!.first.source, 'dungeonTilesetII_v1.json');
      expect(map.tileSets!.first.name, '0x72_DungeonTilesetII_v1.3');
      expect(map.tileSets!.first.tileCount, 1024);
      expect(map.tileSets!.first.image, '0x72_DungeonTilesetII_v1.3.png');
      expect(map.layers, isNotNull);
      expect(map.layers, hasLength(2));
      expect(map.layers!.first, isA<TileLayer>());
    });

    test('reads base64 map without compression', () async {
      final reader = TiledJsonReader(
        'test/assets/compressed/map_base64_sem_compressao.tmj',
      );

      final map = await reader.read();

      expect(map.width, 10);
      expect(map.height, 10);
      expect(map.tileSets, hasLength(1));
      expect(map.tileSets!.first.source, '0x72_DungeonTilesetII_v1.3.tsj');

      final firstLayer = map.layers!.first as TileLayer;
      expect(firstLayer.encoding, 'base64');
      expect(firstLayer.compression, '');
      expect(firstLayer.data, hasLength(100));
      expect(firstLayer.data!.first, 68);
    });

    test('reads base64 map with zlib compression', () async {
      final reader =
          TiledJsonReader('test/assets/compressed/map_base64_zlib.tmj');

      final map = await reader.read();

      expect(map.width, 10);
      expect(map.height, 10);
      expect(map.tileSets, hasLength(1));
      expect(map.tileSets!.first.source, '0x72_DungeonTilesetII_v1.3.tsj');
      expect(map.tileSets!.first.tileCount, 1024);
      expect(map.tileSets!.first.tiledVersion, '1.9.0');

      final firstLayer = map.layers!.first as TileLayer;
      expect(firstLayer.encoding, 'base64');
      expect(firstLayer.compression, 'zlib');
      expect(firstLayer.data, hasLength(100));
      expect(firstLayer.data!.first, 2);
    });

    test('reads tiled 1.5 map and resolves tileset in same folder', () async {
      final reader = TiledJsonReader('test/assets/tiled1.5/mapTest.json');

      final map = await reader.read();

      expect(map.width, 50);
      expect(map.height, 50);
      expect(map.tileSets, hasLength(1));
      expect(map.tileSets!.first.source, 'TileSetTest.json');
      expect(map.tileSets!.first.name, 'TileSetTest');
      expect(map.tileSets!.first.tileWidth, 16);
      expect(map.tileSets!.first.tileHeight, 16);
    });

    test('throws for unsupported map extension', () {
      expect(
        () => TiledJsonReader('test/assets/mapa1.txt'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
