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
  parameter LN = 4,          // counter length
  parameter CW = $clog2(LN)  // counter width 
)(
  input  wire clk,           // clock
  input  wire rst_n_i,       // asynchronous active low reset input
  output reg  rst_n_o        //  synchronous active low reset output
);

reg [CW-1:0] cnt;

// counter
always @ (posedge clk, negedge rst_n_i)
if      (~rst_n_i)  cnt <= {CW{1'b0}};
else if (~rst_n_o)  cnt <= cnt + 'd1;

// output reset
always @ (posedge clk, negedge rst_n_i)
if      (~rst_n_i)  rst_n_o <= 1'b0;
else if (cnt==LN)   rst_n_o <= 1'b1;

                endmodule
