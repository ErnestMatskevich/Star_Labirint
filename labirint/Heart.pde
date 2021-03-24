class Heart{

  void heart(int h_x_start, int x_step, int y_up_line, int y_down_line, int y_down_wall, int y_down){
  smooth();
  beginShape();
  vertex(h_x_start, y_down_wall); //левая стенка
  vertex(h_x_start,y_down_line); 
  
  vertex(h_x_start+x_step, y_up_line);
  vertex(h_x_start+2*x_step, y_down_line);  
  vertex(h_x_start+3*x_step, y_up_line); 
  
  vertex(h_x_start+4*x_step, y_down_line); // правая стенка
  vertex(h_x_start+4*x_step,y_down_wall);
  
  vertex(h_x_start+2*x_step, y_down); //нижняя вершина
  endShape(CLOSE);

}} 
