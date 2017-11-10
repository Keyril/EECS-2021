module labK6;
reg a, b, c; // reg without size means 1-bit
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
  a = 1; b = 0; c = 0;
  #10 $display("a=%b b=%b c=%b z=%b", a, b, c, z);
  $finish;
end


endmodule
