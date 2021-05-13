class Ship extends GameObject {
    PVector speed = new PVector(0,0);
    
    @Override
    protected void update() {
        position = position.add(speed);
        speed = speed.mult(0.99);
    }

    @Override
    protected void input() {
        switch(key) {
            case 'w':
            case 's':
                thrustForward((key == 'w' ? 1 : -1) * 0.3);
                break;
            case 'a':
            case 'd':
                turn((key == 'd' ? 1 : -1) * 0.03);
        }
    }
    
    //Dreieck mit Ausrichtung
    @Override
    protected void draw() {
        stroke(255);
        triangle( -10, 10, 0, -20, 10, 10);
    }
    
    void fire() {}
    
    //Schub geben in Richtung des Schiffs (angle)
    //der Parameter "amount" gibt die Größe des Schubs an
    void thrustForward(float amount) {
        PVector thrust = new PVector(0, -amount); // pointing up
        thrust.rotate(angle);
        speed.add(thrust);
        // TODO: Terminal Velocity
    }
}
