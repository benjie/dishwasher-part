fiddle = 0.003;

baseWidth = 31;
baseRadius = baseWidth/2;
baseHeight = 3.1;
baseTroughHeight = 1;

innerWidth = 22;
innerRadius = innerWidth/2;
innerHoleWidth = 18;
innerHoleRadius = innerHoleWidth/2;
innerHeight = 7.6;

toothHeight = 2.4;
toothWidth = 1.1;
toothBredth = 7.5;

baseTroughWidth = (innerWidth + (baseWidth - innerWidth)/2);
baseTroughRadius = baseTroughWidth/2;

quadHoleHeight = innerHeight - toothHeight;
quadHoleInnerRadius = innerRadius - 1;
quadHoleOuterRadius = baseTroughRadius - 1;

difference() {
	union() {
		difference() {
			translate([0, 0, baseHeight/2]) {
				cylinder(h = baseHeight, r = baseRadius, center = true);
			}
			translate ([0, 0, baseHeight - (baseTroughHeight/2)]) {
				cylinder(h = baseTroughHeight+fiddle, r = baseTroughRadius, center = true);
			}
		}
		translate ([0,0,innerHeight/2]) {
			cylinder(h = innerHeight, r = innerRadius, center = true);
		}
		translate ([0, 0, innerHeight - toothHeight/2]) {
			difference() {
				intersection() {
					cylinder(toothHeight, innerRadius+toothWidth, innerRadius, true);
					union() {
						cube([innerWidth + toothWidth*2, toothBredth, toothHeight], true);
						cube([toothBredth, innerWidth + toothWidth*2, toothHeight], true);
		
					}
		
		        }
				cylinder(innerHeight, innerHoleRadius, center = true);
		    }
		}
	}
	translate([0, 0, innerHeight/2]) {
		cylinder(h = innerHeight+fiddle, r = innerHoleRadius, center=true);
	}
			translate ([0, 0, quadHoleHeight/2]) {
				intersection() {
					difference() {
						cylinder(quadHoleHeight+fiddle, r = quadHoleOuterRadius, center=true);
						cylinder(quadHoleHeight+fiddle, r = quadHoleInnerRadius, center=true);
					}
					union() {
						cube([quadHoleOuterRadius*2, toothBredth, quadHoleHeight+2*fiddle], true);
						cube([toothBredth, quadHoleOuterRadius*2, quadHoleHeight+2*fiddle], true);
		
					}
		
		        }
			}
	
}