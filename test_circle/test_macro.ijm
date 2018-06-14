image_id=getImageID();
run("Duplicate...","title=[tmp_im]")
tmp_image_id = getImageID();
selectImage(tmp_image_id)
width=getWidth();
getPixelSize(unit, pixelWidth, pixelHeight);
run("Gaussian Blur...", "sigma=1");
setAutoThreshold("Default dark");
run("Convert to Mask");
run("Hough Circle Transform","minRadius="+ width*0.2 + ", maxRadius=" +width*0.95+ ", inc=1, minCircles=1, maxCircles=1, threshold=0.5, resolution=200, ratio=1.0, bandwidth=10, local_radius=10,  reduce results_table");
while(isOpen("Results")==0){
	wait(1000);
	};
print("X" + getResult("X (microns)" , 0));
print("Y" + getResult("Y (microns)" , 0));
print("Radius" + getResult("Radius (microns)" , 0));
var X=getResult("X (microns)" , 0)/pixelWidth;
var Y=getResult("Y (microns)" , 0)/pixelWidth;
var R=getResult("Radius (microns)",0)/pixelWidth;
//var X=getResult("X (microns)" , 0);
//var Y=getResult("Y (microns)" , 0);
//var R=getResult("Radius (microns)",0);

if (isOpen("Results")) {
         selectWindow("Results");
         run("Close");
    };
print("X=" + X);    
print("Y=" + Y) ;   
print("R=" + R)  ; 
selectImage(tmp_image_id);
run("Close");
selectImage(image_id);
makeOval(X-R, Y-R, R*2, R*2);