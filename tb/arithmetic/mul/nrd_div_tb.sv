// Iterative divider testbench

module nrd_div_tb ();

    logic clk_i, reset_i, signed_i, v_i, yumi_i;
    logic [31:0] a_i, b_i;
    logic ready_o, v_o;
    logic [31:0] div_o, rem_o;

    nrd_div #(.data_width_p(32)) dut (.*);

    task send_trace (logic [31:0] dividend, divisor);
        a_i = dividend;
        b_i = divisor;
        v_i = 1;
        @(posedge clk_i);
        v_i = 0;
        @(posedge v_o);
        @(posedge clk_i);
        yumi_i = 1;
        @(posedge clk_i);
        yumi_i = 0;
        assert($signed(dividend) / $signed(divisor) == $signed(div_o)) else
            $error("Incorrect result: %d / %d != %d", $signed(dividend), $signed(divisor), $signed(div_o));
        assert(($signed(dividend) % $signed(divisor)) == $signed(rem_o)) else
            $error("Incorrect result: %d mod %d != %d", $signed(dividend), $signed(divisor), $signed(rem_o));
    endtask

    always #5 clk_i = ~clk_i;

    initial begin
        int dividend, divisor;
        clk_i = 0;

        {v_i, yumi_i, a_i, b_i} = '0;
        signed_i = 1'b1;

        reset_i = 1;
        @(posedge clk_i);
        reset_i = 0;
        
        for (int i = 0; i < 25; i++) begin
            dividend = $urandom_range(-1+2**31) - 2**30;
            divisor = $urandom_range(-1+2**31) - 2**30;
            send_trace(dividend, divisor);
        end

        $display("All test cases passed.");

        $finish;
    end

endmodule
