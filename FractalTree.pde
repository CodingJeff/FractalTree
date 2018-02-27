private double fractionLength = .8; 
private int smallestBranch = 7; 
private double branchAngle = .25;  
public void setup() 
{   
	size(640,550);    
	noLoop(); 
} 
public void draw() 
{   
	background(255);   
	stroke((int)(Math.random()*255+1),(int)(Math.random()*255+1),(int)(Math.random()*255+1));   
	line(320,550,320,450);   
	drawBranches(320,450,100,3*Math.PI/2);  
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1= angle+branchAngle;
	double angle2 = angle-branchAngle;
	branchLength=branchLength*fractionLength;
	int endX1=(int)(branchLength*Math.cos(angle1)+x);
	int endY1= (int)(branchLength*Math.sin(angle1)+y);
	int endX2=(int)(branchLength*Math.cos(angle2)+x);
	int endY2=(int)(branchLength*Math.sin(angle2)+y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 
public void MousePressed()
{
redraw();
}