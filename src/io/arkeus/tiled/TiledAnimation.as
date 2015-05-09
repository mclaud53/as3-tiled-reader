package io.arkeus.tiled {
    /**
     * Represents animation of tile.
     */
    public class TiledAnimation {
        /** The vector of frames. */
        public var frames:Vector.<TiledFrame>;

        public function TiledAnimation(animation:XMLList) {
            frames = new Vector.<TiledFrame>();
            for (var i: uint = 0; i < animation.frame.length(); i++) {
                frames.push(new TiledFrame(animation.frame[i]));
            }
        }
    }
}
