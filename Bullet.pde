class Gun extends GameObject {
    Gun(GameObject parent) {
        this.parent = parent;
    }

    void shoot() {
        game.bullets.shoot(parent.position, parent.speed, parent.scale, parent.angle);
    }
}

class BulletManager extends LayerManager<Bullet> {
    int bulletIndex = 0;

    BulletManager() {
        layers = new ArrayList<Bullet>(256);
        for (int i = 0; i < 256; i++) {
            layers.add(new Bullet());
        }
    }

    void shoot(PVector position, PVector speed, float scale, float angle) {
        Bullet current = layers.get(bulletIndex);
        current.position = position.copy();
        current.speed = speed.copy();
        current.speed.add(PVector.fromAngle(angle - PI / 2).mult(4.0));
        current.angle = angle;
        current.scale = scale;
        current.hidden = false;
        current.frozen = false;
        bulletIndex = (bulletIndex + 1) % layers.size();
    }
}

class Bullet extends GameObject {

    Bullet() {
        hidden = true;
        frozen = true;
    }

    @Override
    void draw() {
        strokeWeight(3);
        stroke(255,255,0);
        point(0, 0);
        strokeWeight(1);
    }

    @Override
    void update() {
        position.add(speed);
    }
}
