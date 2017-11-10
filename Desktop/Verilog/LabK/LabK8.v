module labK8;
reg a, b, c, flag, expect;
wire outputOne, outputTwo, notOutput, lowerInputOne, finalInputOne, finalInputTwo, z;


not my_not(notOutput, c);
and my_andOne(outputOne, a, lowerInputOne);
and my_andTwo(outputTwo, b, c);
or my_or(z, finalInputOne, finalInputTwo);
assign lowerInputOne = notOutput;
assign finalInputOne = outputOne;
assign finalInputTwo = outputTwo;



initial
begin
  flag = $value$plusargs("a=%b", a);
  flag = $value$plusargs("b=%b", b);
  flag = $value$plusargs("c=%b", c);
  //expect = ((a & ~c) | (b & c));
  expect = (c == 1) ? b : a;
  #10;
  if (expect === z)
    $display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
  else
    $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
  $finish;
end


endmodule
