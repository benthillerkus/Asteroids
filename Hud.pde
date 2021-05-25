class Hud extends Layer {
    @Override
    protected void draw() {
        pushMatrix(); // Offset Status Bar
        translate(0, -30 * pixelFactor);

        // Health
        noFill();
        stroke(235, 125, 125, 80);
        strokeWeight(1 * pixelFactor);
        rectMode(CENTER);
        rect(width / 2, height - 70 * pixelFactor, width / 3, 20 * pixelFactor);
        noStroke();
        fill(255, 75, 75, 50);
        rect(width / 2, height - 70 * pixelFactor, (width / 3) * game.ship.health / game.ship.maxHealth, 20 * pixelFactor);

        // Speed
        fill(255);
        textSize(50 * pixelFactor);
        textAlign(CENTER, BOTTOM);
        text(int(game.ship.speed.mag() * 60), width * 0.82, height - 45 * pixelFactor);
        textSize(20 * pixelFactor);
        text("m/s", width * 0.85, height - 35 * pixelFactor);

        // Position
        pushMatrix(); // Move Minimap
        translate(width * 0.15, height - 70 * pixelFactor);
        stroke(255);
        strokeWeight(1 * pixelFactor);
        noFill();
        ellipseMode(RADIUS);
        float mapSize = 55 * pixelFactor;
        ellipse(0, 0, mapSize, mapSize);
        strokeWeight(8 * pixelFactor);
        stroke(255);
        PVector shipDrawPoint = game.ship.position.copy().div(175).limit(mapSize);
        point(shipDrawPoint.x, shipDrawPoint.y);

        for (Layer layer : game.missions.overlay.layers) {
            if (layer instanceof Beacon) {
                if (layer.hidden) continue;
                Beacon beacon = (Beacon) layer;
                shipDrawPoint = beacon.position.copy().div(175).limit(mapSize);
                stroke(beacon.missionColor);
                point(shipDrawPoint.x, shipDrawPoint.y);
            }
        }
        popMatrix(); // Move Minimap
        popMatrix(); // Offset Status Bar

        // Modes
        Player[] players = {game.player1, game.player2};
        for (int i = 0; i < 2; i++) {
            textSize(35 * pixelFactor);
            textAlign(CENTER);
            fill(players[i].playerColor);
            pushMatrix();
            translate(width / 2, height / 2);
            rotate(HALF_PI);
            scale(i == 0 ? 1 : -1);
            translate(0, width * 0.45);
            text(players[i].mode.name, 0, 0);
            fill(players[i].playerColor, 50);
            textAlign(RIGHT);
            text(players[i].mode.previous().name, -90, 0);
            textAlign(LEFT);
            text(players[i].mode.next().name, 90, 0);
            popMatrix();
        }
    }
}
