//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  reset signal debouncing and synchronization                             //
//                                                                          //
//  Copyright (C) 2010  Iztok Jeras                                         //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  This RTL is free hardware: you can redistribute it and/or modify        //
//  it under the terms of the GNU Lesser General Public License             //
//  as published by the Free Software Foundation, either                    //
//  version 3 of the License, or (at your option) any later version.        //
//                                                                          //
//  This RTL is distributed in the hope that it will be useful,             //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of          //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           //
//  GNU General Public License for more details.                            //
//                                                                          //
//  You should have received a copy of the GNU General Public License       //
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.   //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////

module reset #(
  parameter SW = 2,          // synchronizer width 
  parameter LN = 5,          // counter length
  parameter CW = $clog2(LN)  // counter width 
)(
  input  wire clk_i,         // clock input
  input  wire clk_o,         // clock output
  input  wire rst_n_i,       // asynchronous active low reset input
  output wire rst_n_o        //  synchronous active low reset output
);

// local signals
reg  [SW-1:0] syn_i;
wire          rst_s_i;
reg  [CW-1:0] cnt;
reg           ful;
reg  [SW-1:0] syn_o;


// input clock synchronization
always @ (posedge clk_i, negedge rst_n_i)
if (~rst_n_i)  syn_i <= {SW{1'b0}};
else           syn_i <= {syn_i[SW-2:0], 1'b1};

// input clock synchronized reset
assign rst_s_i = syn_i[SW-1];

// counter
always @ (posedge clk_i, negedge rst_s_i)
if (~rst_s_i)  cnt <= {CW{1'b0}};
else           cnt <= cnt + {{CW-1{1'b0}}, ~ful};

// counter full
always @ (posedge clk_i, negedge rst_s_i)
if (~rst_s_i)  ful <= 1'b0;
else           ful <= (cnt==LN) | ful;

// output clock synchronization
always @ (posedge clk_o, negedge rst_s_i)
if (~rst_s_i)  syn_o <= {SW{1'b0}};
else           syn_o <= {syn_o[SW-2:0], ful};

// output clock synchronized reset
assign rst_n_o = syn_o[SW-1];

endmodule
