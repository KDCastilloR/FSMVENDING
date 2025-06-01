`timescale 1ns / 1ps
module tt_um_KDCastillo_FSMVENDING (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,     
    input  wire       rst_n
);

// Aquí dentro conectas con tu módulo FSM top (top_maquina)

wire [1:0] moneda = ui_in[1:0];
wire comprarA = ui_in[2];
wire comprarB = ui_in[3];

wire [3:0] total;
wire [3:0] cambio;
wire listoA, listoB;

// Instancia tu FSM top con las señales adecuadas
top_maquina top_inst (
    .clk(clk),
    .reset(~rst_n),      // Invertir rst_n para reset activo alto
    .moneda(moneda),
    .comprarA(comprarA),
    .comprarB(comprarB),
    .listoA(listoA),
    .listoB(listoB),
    .total(total),
    .cambio(cambio)
);

// Mapear salidas a uo_out para observar en el testbench
assign uo_out[3:0] = total;
assign uo_out[4]   = listoA;
assign uo_out[5]   = listoB;
assign uo_out[7:6] = 2'b00;  // Reservado o sin uso

// Bidireccionales no usados (si quieres ponerlos en 0)
assign uio_out = 8'b0;
assign uio_oe  = 8'b0;

endmodule

