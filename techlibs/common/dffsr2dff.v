(* techmap_celltype = "$dffsr" *)
module dffsr2dff (CLK, SET, CLR, D, Q);
   parameter WIDTH = 1;
   parameter CLK_POLARITY = 1;
   parameter SET_POLARITY = 1;
   parameter CLR_POLARITY = 1;

   input CLK;
   input [WIDTH-1:0] D, SET, CLR;
   output reg [WIDTH-1:0] Q;
   wire reg [WIDTH-1:0] NEXT_Q;


   wire [1023:0]  _TECHMAP_DO_ = "proc;;";

   generate
      genvar      i;
      for(i = 0; i < WIDTH; i=i+1) begin
         always @* begin
            if (CLR[i] == CLR_POLARITY)
              NEXT_Q[i] <= 1'b0;
            else if (SET[i] == SET_POLARITY)
              NEXT_Q[i] <= 1'b1;
            else
              NEXT_Q[i] <= D[i];
         end

      end
   endgenerate

   if (CLK_POLARITY)
     always @(posedge CLK)
       Q <= NEXT_Q;
   else
     always @(negedge CLK)
       Q <= NEXT_Q;

endmodule // dffsr2dff
