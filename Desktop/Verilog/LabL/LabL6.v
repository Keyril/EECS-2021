module labL6;

   reg  [31:0] a, b, expect;
   reg         cin;
   wire [31:0] z;
   wire        cout;

   yAdder adder(z, cout, a, b, cin);

   initial
     begin
        repeat (3)
          begin
             a = $random;
             b = $random;
             cin = 0;

             expect = a + b + cin;

             #1; // wait for z
             if (expect === z)
               $display("PASS: a=%b b=%b cin=%b z=%b expect=%b",a, b, cin, z, expect);
             else
               $display("FAIL: a=%b b=%b cin=%b z=%b expect=%b",a, b, cin, z, expect);

          end
        $finish;
     end

endmodule
