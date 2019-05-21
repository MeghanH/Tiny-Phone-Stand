module socketSTL(){
	scale([0.53,0.53,0.53])
	translate([25,-12.4,-1.63])
	import("../Imports/socket.stl");
}
  
module buckleConnector(){
	translate([32, -0, 0]) {
		minkowski(){
			cube(size = [10, 15, 3.6], center = false);
			sphere(r=1);
		}
	}
}


module middleBody(){
	translate([50, 0, 0]) {
		minkowski(){
			cube(size = [1, 15, 3.6], center = false);
			sphere(r=1);
		}
	}
}

module endBody(){
	translate([40, 0, 0]) {
		minkowski(){
			cube(size = [30, 15, 3.6], center = false);
			sphere(r=1);
		}
	}
}

module notch(){
	translate([55, -10, -5]) {
		minkowski(){
			cube(size = [10, 20, 20], center = false);
			sphere(r=1);
		} 
	}
}
module mainBody(){
	hull(){
		buckleConnector();
		middleBody();
	}

	difference(){
		endBody();
		notch();
	}
}

socketSTL();
rotate([0,0,180]){
	translate([-60,-20,0]){
    
		difference(){
   
			mainBody();
			notch();
		}
	}
}

