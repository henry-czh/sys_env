module cpu(
  input clk,
  input rst_n
);

core core(.clk(clk),
		  .rst_n(rst_n)
		  );

initial begin
	$display("This is design cpu!");
end

endmodule
