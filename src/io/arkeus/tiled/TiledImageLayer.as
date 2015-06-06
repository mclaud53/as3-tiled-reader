package io.arkeus.tiled {
	/**
	 * A class representing an <imagelayer> layer. In addition to the base layer properties,
	 * an image layer contains a single image.
	 */
	public class TiledImageLayer extends TiledLayer {
		/** The x value of the image. */
		public var x:int;
		/** The y value of the image. */
		public var y:int;
		/** The layer's image. */
		public var image:TiledImage;

		/**
		 * @param tmx The XML containing the <imagelayer> object.
		 */
		public function TiledImageLayer(tmx:XML) {
			super(tmx);
			x = "@x" in tmx ? tmx.@x : 0;
			y = "@y" in tmx ? tmx.@y : 0;
			image = new TiledImage(tmx.image);
		}
	}
}