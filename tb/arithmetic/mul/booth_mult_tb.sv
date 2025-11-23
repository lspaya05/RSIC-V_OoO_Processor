// Iterative multiplier testbench

`define data_width 32

module booth_mult_tb ();
    
    logic clk_i, reset_i, v_i, yumi_i;
    logic [`data_width-1:0] a_i, b_i;
    logic ready_o, v_o;
    logic [2*`data_width-1:0] data_o;

    booth_mult #(.data_width_p(`data_width)) dut (.*);

    // Clock generation
    always #5 clk_i = ~clk_i;

    initial begin
        // Initialize signals
        {clk_i, v_i, yumi_i, a_i, b_i} = '0;
        reset_i = 1; 
        repeat (2) @(posedge clk_i); // Hold reset for 2 cycles
        reset_i = 0; 

        // Run multiple test cases
        for (int i = 0; i < 5; i++) begin
            a_i = $urandom_range(0, 100) - 50;
            b_i = $urandom_range(0, 100) - 50;
            $display("%d %d", a_i, b_i);
            v_i = 1'b1;
            
            @(posedge clk_i);
            v_i = 1'b0; // Deassert input after one cycle

            // Wait for v_o to be asserted
            wait (v_o === 1'b1);
            assert (v_o) else $fatal("Error: v_o not asserted when expected!");

            // Assert that data_o matches a_i * b_i
            assert ($signed(data_o) === $signed(a_i) * $signed(b_i))
            else $fatal("Error: data_o = %d, expected %d (a_i * b_i)", $signed(data_o), $signed(a_i) * $signed(b_i));

            // Hold yumi_i for one cycle
            yumi_i = 1'b1;
            @(posedge clk_i);
            yumi_i = 1'b0;

            // Ensure v_o is deasserted after yumi_i is acknowledged
            @(negedge v_o);
            assert (!v_o) else $fatal("Error: v_o not deasserted after yumi_i!");
        end

        $display("All test cases passed!");
        $finish;
    end
endmodule
