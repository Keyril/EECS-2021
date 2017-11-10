module labK1;
reg [31:0]
one = &x;
two = x[1:0];
three = {one, two};
initial
begin
  $display("time = %5d, x = %b", $time, x);
  x = 0;
  $display("time = %5d, x = %b", $time, x);
  x = x + 2;
  $display("time = %5d, x = %b", $time, x);
  $finish;
end
endmodule
