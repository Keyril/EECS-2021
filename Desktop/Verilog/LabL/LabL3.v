module labL2;
reg c;
reg [31:0] a, b, expect;
wire [31:0] z;
yMux #(32) my_mux(z, a, b, c);


initial
repeat (10)
begin
 a = $random;
 b = $random;
 c = $random % 2;
 #1;
  expect = (c == 1) ? b : a;
  if (expect == z)
    $display("PASS: a=%b b=%b c=%b z=%b expect=%b", a, b, c, z, expect);
  else
    $display("FAIL: a=%b b=%b c=%b z=%b expect=%b", a, b, c, z, expect);
 // compare z with the expected output
end



endmodule
