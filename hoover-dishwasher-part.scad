fiddle = 0.003;

baseWidth = 31;
baseHeight = 3.1;
baseTroughHeight = 1;

innerWidth = 22;
innerHoleWidth = 18;
innerHeight = 7.6;

toothHeight = 2.4;
toothWidth = 1.1;
toothBredth = 7.5;

baseTroughWidth = (innerWidth + (baseWidth - innerWidth)/2);

quadHoleHeight = innerHeight - toothHeight;
quadHoleInnerRadius = innerWidth - 1;
quadHoleOuterRadius = baseTroughWidth - 1;

difference() {
	union() {
		difference() {
			translate([0, 0, baseHeight/2]) {
				cylinder(h = baseHeight, r = baseWidth, center = true);
			}
			translate ([0, 0, baseHeight - (baseTroughHeight/2)]) {
				cylinder(h = baseTroughHeight+fiddle, r1 = baseTroughWidth, r2 = 27, center = true);
			}
		}
		translate ([0,0,innerHeight/2]) {
			cylinder(h = innerHeight, r = innerWidth, center = true);
		}
		translate ([0, 0, innerHeight - toothHeight/2]) {
			difference() {
				intersection() {
					cylinder(toothHeight, innerWidth+toothWidth, innerWidth, true);
					union() {
						cube([(innerWidth + toothWidth) * 2, toothBredth * 2, toothHeight], true);
						cube([toothBredth * 2, (innerWidth + toothWidth) * 2, toothHeight], true);
		
					}
		
		        }
				cylinder(innerHeight, innerHoleWidth, center = true);
		    }
		}
	}
	translate([0, 0, innerHeight/2]) {
		cylinder(h = innerHeight+fiddle, r = innerHoleWidth, center=true);
	}
			translate ([0, 0, quadHoleHeight/2]) {
				intersection() {
					difference() {
						cylinder(quadHoleHeight+fiddle, r = quadHoleOuterRadius, center=true);
						cylinder(quadHoleHeight+fiddle, r = quadHoleInnerRadius, center=true);
					}
					union() {
						cube([quadHoleOuterRadius*2, toothBredth * 2, quadHoleHeight+2*fiddle], true);
						cube([toothBredth * 2, quadHoleOuterRadius*2, quadHoleHeight+2*fiddle], true);
		
					}
		
		        }
			}
	
}