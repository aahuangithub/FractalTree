private int smallestBranch = 10; 
private float branchAngle = PI/3;  
public void setup() 
{   
	size(900,1000);    

} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);      
	drawBranches(width/2,height-100,300,branchAngle);
	if(branchAngle>=2*PI/3-0.1)branchAngle=PI/3+0.1; //if branch angle >= pi-starting angle...
	branchAngle+=0.005;
} 
public void drawBranches(float x,float y, float branchLength, float angle) 
{   
	if(branchLength <= smallestBranch){
		line(
			x, y, x+branchLength*(float)cos(angle), y-branchLength*(float)sin(angle));
		line(
			x, y, x-branchLength*(float)cos(angle), y-branchLength*(float)sin(angle));
	}
	else{
		line(
			x, y, x+branchLength*(float)cos(angle), y-branchLength*(float)sin(angle));
		line(
			x, y, x-branchLength*(float)cos(angle), y-branchLength*(float)sin(angle));
		drawBranches(x-branchLength*(float)cos(angle), y-branchLength*(float)sin(angle), branchLength*0.5, angle);
		drawBranches(x+branchLength*(float)cos(angle), y-branchLength*(float)sin(angle), branchLength*0.5, angle);
	}
} 
