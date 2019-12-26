module core(
  input clk,
  input rst_n
);

initial begin
	#5;
	`ifdef CORE_A
		$display("This is design coreA!");
	`endif
	`ifdef CORE_B
		$display("This is design coreB!");
	`endif
end

endmodule
