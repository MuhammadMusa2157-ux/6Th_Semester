module ud_counter(
    	C,
    	R,
    	UD,  //high for UP counter and low for Down counter
    	COUNT
    	);
    	
   	input C, R, UD;
   	output [3:0] COUNT;
   	
	reg [3:0] COUNT;  
    
     	always @(posedge C or posedge R)
     		if(R)   //Active high R
        			COUNT <= 0;
        		else    
            			if(UD)   //Up mode selected
                				COUNT <= COUNT + 1; //Increment Counter
            			else  //Down mode selected
                				COUNT <= COUNT - 1; //Decrement Counter
                				 
endmodule
