abstract class Layer {
    private int lastProcessedFrame = -1;
    boolean freeze = false;
    boolean hide = false;

    Layer() {}

    Layer(boolean freeze, boolean hide) {
        this.freeze = freeze;
        this.hide = hide;
    }

    // Runs once every frame before draw
    protected void update() {};

    // Put your drawing code here
    abstract protected void draw();

    final void render() {
        if (!freeze && frameCount != lastProcessedFrame) {
            update();
            lastProcessedFrame = frameCount;
        }
        if (!hide) draw();
    }
}

class LayerManager extends Layer {
    final ArrayList<Layer> layers;
    
    LayerManager() {
        layers = new ArrayList<Layer>();
    }
    
    @Override
    protected void draw() {
        for (Layer layer : layers) {
            layer.render();
        }
    }
}
