`include "uvm_macros.svh"
`include "sequencer/items/srandomizer/randomizer.sv";
import uvm_pkg::*;
import defs::*;

class general_seq_item extends uvm_sequence_item;

	`uvm_object_utils(general_seq_item)

	randomizer randomizer_i;
	string in;

	//Constructor
	function new(string name = "general_seq_item");
		super.new(name);
		randomizer_i = new;
	endfunction : new

	function void post_randomize();
		randomizer_i.randomize();
		in = randomizer_i.get_str();
	endfunction : post_randomize

	function void print();
		$display("Seq item with size %d\nValue %s",in.len(),in);
	endfunction : print

endclass
