`timescale 1ns/1ns
module test();

logic clk;
logic a, b, c, d;

initial begin
  $fsdbDumpfile("dump.fsdb");
  $fsdbDumpvars;

  clk=0;
  a=0;
  b=0;
  c=0;
  d=0;
  
  #10

  a=1;
  b=1;

  #10
  c=1;

  #10

  $finish;

end


always begin
  #1;
  clk = ~clk;
end

assert property ( @(posedge clk) a -> (!c) ); 


endmodule
