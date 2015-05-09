package io.arkeus.tiled {
	/**
	 * Represents a frame of animation of tile.
	 */
	public class TiledFrame {
		/** The tile id. */
		public var tileId:String;
		/** Duration of display of a frame. */
		public var duration:int;

		public function TiledFrame(tmx:XML) {
			tileId = tmx.@tileid;
			duration = tmx.@duration;
		}
	}
}
