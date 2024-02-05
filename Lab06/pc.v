module pc (
        input rst, clk,
        output reg [31:0] address
);
    always @ (negedge rst or posedge clk) begin
        if (!rst) address = 0;
        else address = address + 1;
    end
endmodule