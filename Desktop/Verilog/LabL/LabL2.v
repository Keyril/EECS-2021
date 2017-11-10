module labL2;
reg c;
reg [1:0] a, b;
integer i, j, k;
wire [1:0] z;
yMux2 inst_1 (z, a, b, c);


initial
begin
  for (i = 0; i < 4; i = i + 1)
  for (j = 0; j < 4; j = j + 1)
  for (k = 0; k < 2; k = k +1)
    begin
      a = i; b = j; c = k;
      #10;
      $display("a=%b b=%b c=%b z=%b", a, b, c, z);
    end
  $finish;
end


endmodule
