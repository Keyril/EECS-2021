module labK9;
reg a, b, cin;
reg [1:0] expect;
wire OutputXorOne, LowerInputXorTwo, HigherInputAndTwo, OutputAndOne, OutputAndTwo, HigherInputOr, LowerInputOr, z, cout;
integer i, j, k;

xor my_xorOne(OutputXorOne, b, a);
and my_andOne(OutputAndOne, a, b);
xor my_xorTwo(z, cin, LowerInputXorTwo);
and my_andTwo(OutputAndTwo, HigherInputAndTwo, cin);
or my_or(cout, HigherInputOr, LowerInputOr);

assign LowerInputXorTwo = OutputXorOne;
assign HigherInputAndTwo = OutputXorOne;
assign HigherInputOr = OutputAndTwo;
assign LowerInputOr = OutputAndOne;




initial
begin
  for (i = 0; i < 2; i = i + 1)
    begin
      for (j = 0; j < 2; j = j + 1)
        begin
          for (k = 0; k < 2; k = k +1)
            begin
              a = i; b = j; cin = k;
              expect = a + b + cin;
              #10;
              if ((expect[0] === z) && (expect[1] === cout))
                $display("PASS: a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
              else
                $display("FAIL: a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
            end
          end
        end
  $finish;
end


endmodule
