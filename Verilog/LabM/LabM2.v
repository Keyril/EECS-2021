module labM;

reg [31:0] d;
reg clk, enable, flag;
wire [31:0] z;
register #(32) mine(z, d, clk, enable);



initial
begin
  flag = $value$plusargs("enable=%b", enable);
  clk = 0;
      $monitor("%5d: clk=%b,d=%d,z=%d,expect=%d", $time,clk,d,z, enable);
      repeat (20)
      begin
        #2 d = $random;
      end
      $finish;
end
    always
      begin
        #5 clk = ~clk;
      end
endmodule
