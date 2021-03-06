private int smallestBranch = 5; 
private float startAngle = PI/3+0.3;
private float branchAngle = startAngle;
private boolean facingRight = false;  
public void setup() 
{   
	size(800,800);  
} 
public void draw() 
{   
	background(0);   

	drawBranches(width/2,height-250*sin(branchAngle)+100,300,branchAngle);
	if(branchAngle>=PI-startAngle){
		branchAngle=startAngle; //if branch angle >= pi-starting angle...
		facingRight=!facingRight;
	}
	branchAngle+=0.003;
		
	//green lines
	if(Math.random()-Math.random()<-0.8) {
		if(Math.random()-Math.random()<0.5)
			drawBranches(width/2+(int)(Math.random()*100)-50,height-250*sin(branchAngle)+100+(int)(Math.random()*100)-50,300,branchAngle);
		strokeWeight((int)(Math.random()*10));
		int a = (int)(Math.random()*width);
		line(a, 0, a, height);
	}
} 
public void drawBranches(float x,float y, float branchLength, float angle) 
{   
	if(branchLength <= smallestBranch){
		stroke(0, (facingRight?200:255), 0);
		line(
			x, y, x+branchLength*(float)cos(angle), y-branchLength*(float)sin(angle));
		stroke(0, (!facingRight?200:255), 0);
		line(
			x, y, x-branchLength*(float)cos(angle), y-branchLength*(float)sin(angle));
	}
	else{
		strokeWeight(facingRight?1:2);
		stroke(0, (facingRight?200:255), 0);
		line(
			x, y, x+branchLength*(float)cos(angle), y-branchLength*(float)sin(angle));
		strokeWeight(!facingRight?1:2);
		stroke(0, (!facingRight?200:255), 0);
		line(
			x, y, x-branchLength*(float)cos(angle), y-branchLength*(float)sin(angle));
		drawBranches(x-branchLength*(float)cos(angle), y-branchLength*(float)sin(angle), branchLength*0.51, angle);
		drawBranches(x+branchLength*(float)cos(angle), y-branchLength*(float)sin(angle), branchLength*0.51, angle);
	}
} 
