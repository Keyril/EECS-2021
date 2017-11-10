module labL10 ;

   reg signed [31:0] a, b, expect;
   reg [2:0] op;
   wire ex;
   wire [31:0] z;
   reg  ok = 0, flag;
   reg [1*7:0] operator;

   yAlu alu(z, ex, a, b, op);

   initial
     begin
        repeat (5)
          begin
             a = $random;
             b = $random;
             flag = $value$plusargs("op=%d", op);


             if (op === 3'b000) begin
                expect = a & b;
                operator = "&";
             end
             else if (op === 3'b001) begin
                expect = a | b;
                operator = "|";
             end
             else if (op === 3'b010) begin
                expect = a + b;
                operator = "+";
             end
             else if (op === 3'b110) begin
                expect = a - b;
                operator = "-";
             end
             else if (op === 3'b111) begin
                expect = (a < b) ? 1 : 0;
                operator = "<";
             end

             #1;


             ok = (expect === z) ? 1 : 0;

             if (ok)
               $display("PASS:a=%b b=%b a%sb=%b",a, b, operator, z);
             else
               $display("FAIL:  a=%b    b=%b a%sb=%b expected=%b",a, b, operator, z, expect);
          end
        $finish;
     end

endmodule
