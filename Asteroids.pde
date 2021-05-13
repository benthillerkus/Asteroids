import java.util.*;

LayerManager<Layer> layerManager = new LayerManager<Layer>();

Game game;

int referenceWidth = 1000;
int referenceHeight = 800;

void setup() {
    size(1000, 800);
    surface.setResizable(true);
    
    game = new Game();
    
    layerManager.layers.add(input);
    layerManager.layers.add(game);
    layerManager.layers.add(hud);
    
    game.start();
}

void draw() {
    layerManager.process();
    background(0);
    layerManager.render();
}

Layer hud = new Layer() {
    @Override
    protected void draw() {
        textAlign(LEFT);
        textSize(15);
        text(frameRate, width - 70, 25);
    }
};

InputHelper input = new InputHelper();
