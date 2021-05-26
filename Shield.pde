class Shield extends GameObject {
    float orbitspeed;

    @Override
    protected void reset() {
        super.reset();
        orbitspeed = .05;
        size = 20;
    }

    @Override
    protected void collision(GameObject enemy) {
        if (enemy instanceof  Debris) {
            game.stats.caughtDebris++;
        }
    }

    @Override
    protected void draw() {
        image(images.shield, -28, -8, 56, 30);
    }

    void input() {
        if (key == 'a' || key == 'j'){
            angle -= orbitspeed;
            position.rotate(-orbitspeed);
        }
        else if (key == 'd' || key == 'l'){
            angle += orbitspeed;
            position.rotate(orbitspeed);
        }
        angle %= TWO_PI; 
    }
}