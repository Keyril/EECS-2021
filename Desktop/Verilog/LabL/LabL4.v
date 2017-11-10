module labL4;
reg [1:0] c;
reg [31:0] a0, a1, a2, a3, expect;
wire [31:0] z;
yMux4to1 #(32) inst(z, a0,a1,a2,a3, c);


initial
repeat (10)
begin
 a0 = $random;
 a1 = $random;
 a2 = $random;
 a3 = $random;
 c = $random % 4;
 #1;
  if (c == 0)
    expect = a0;
  else if (c == 1)
    expect = a1;
  else if (c == 2)
    expect = a2;
  else
    expect = a3;
  #1;
  if (expect === z)
    $display("PASS: a0=%b a1=%b a2=%b a3=%b c=%b z=%b expect=%b", a0, a1, a2, a3, c, z, expect);
  else
    $display("FAIL: a0=%b a1=%b a2=%b a3=%b c=%b z=%b expect=%b", a0, a1, a2, a3, c, z, expect);
 // compare z with the expected output
end



endmodule
