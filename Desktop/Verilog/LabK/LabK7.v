module labK7;
reg a, b, c, flag;
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
  #10 $display("a=%b b=%b c=%b z=%b", a, b, c, z);
  $finish;
end


endmodule
