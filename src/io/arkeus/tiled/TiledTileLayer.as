package io.arkeus.tiled {
	/**
	 * Represents a single tile layer within a map.
	 */
	public class TiledTileLayer extends TiledLayer {
		/** The encoding used on the layer data. */
		public var encoding:String;
		/** The compression used on the layer data. */
		public var compression:String;
		/** The parsed layer data, uncompressed and unencoded. */
		public var data:Array;

		public function TiledTileLayer(tmx:XML) {
			super(tmx);
			
			var dataNode:XML = tmx.data[0];
			encoding = "@encoding" in dataNode ? dataNode.@encoding : null;
			compression = "@compression" in dataNode ? dataNode.@compression : null;
            if (null !== encoding) {
                data = TiledUtils.stringToTileData(dataNode.text(), width, encoding, compression);
            } else {
                data = loadTileData(dataNode.tile, width);
            }
		}

        /**
         * Given a list of tiles, builds an array of arrays, where each inner array is
         * a single row in the map, and each element is a tile id.
         *
         * @param tmx The XMLList of <tile> objects.
         * @param mapWidth The width of the map, in tiles. Each row should be the same width.
         * @return The array of arrays representing the map data.
         */
        private static function loadTileData(tmx:XMLList, mapWidth:uint):Array {
            var map:Array = [], row:Array = [];
            for (var i:uint = 0; i < tmx.length(); i++) {
                if (row.length == mapWidth) {
                    map.push(row);
                    row = [];
                }
                row.push(parseInt(tmx[i].@gid));
            }
            map.push(row);
            return map;
        }
	}
}
