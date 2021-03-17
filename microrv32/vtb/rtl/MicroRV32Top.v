// Generator : SpinalHDL v1.4.2    git head : 804c7bd7b7feaddcc1d25ecef6c208fd5f776f79
// Component : MicroRV32Top
// Git hash  : 5dad1ce010963324b7ab3d0490b443a180072ee0


`define InstructionType_defaultEncoding_type [4:0]
`define InstructionType_defaultEncoding_isUndef 5'b00000
`define InstructionType_defaultEncoding_isRegReg 5'b00001
`define InstructionType_defaultEncoding_isRegImm 5'b00010
`define InstructionType_defaultEncoding_isImm 5'b00011
`define InstructionType_defaultEncoding_isBranch 5'b00100
`define InstructionType_defaultEncoding_isLoad 5'b00101
`define InstructionType_defaultEncoding_isStore 5'b00110
`define InstructionType_defaultEncoding_isCT_JAL 5'b00111
`define InstructionType_defaultEncoding_isCT_JALR 5'b01000
`define InstructionType_defaultEncoding_isLUI 5'b01001
`define InstructionType_defaultEncoding_isAUIPC 5'b01010
`define InstructionType_defaultEncoding_isECall 5'b01011
`define InstructionType_defaultEncoding_isFence 5'b01100
`define InstructionType_defaultEncoding_isIllegal 5'b01101
`define InstructionType_defaultEncoding_isCSR 5'b01110
`define InstructionType_defaultEncoding_isCSRImm 5'b01111
`define InstructionType_defaultEncoding_isTrapReturn 5'b10000

`define CSSRAccessType_defaultEncoding_type [2:0]
`define CSSRAccessType_defaultEncoding_CSRidle 3'b000
`define CSSRAccessType_defaultEncoding_CSRread 3'b001
`define CSSRAccessType_defaultEncoding_CSRwrite 3'b010
`define CSSRAccessType_defaultEncoding_CSRset 3'b011
`define CSSRAccessType_defaultEncoding_CSRclear 3'b100

`define controlFSM_enumDefinition_defaultEncoding_type [3:0]
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_BOOT 4'b0000
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit 4'b0001
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch 4'b0010
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode 4'b0011
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute 4'b0100
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack 4'b0101
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap 4'b0110
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR 4'b0111
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt 4'b1000
`define controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt 4'b1001

`define UartParityType_defaultEncoding_type [1:0]
`define UartParityType_defaultEncoding_NONE 2'b00
`define UartParityType_defaultEncoding_EVEN 2'b01
`define UartParityType_defaultEncoding_ODD 2'b10

`define UartStopType_defaultEncoding_type [0:0]
`define UartStopType_defaultEncoding_ONE 1'b0
`define UartStopType_defaultEncoding_TWO 1'b1

`define UartCtrlTxState_defaultEncoding_type [2:0]
`define UartCtrlTxState_defaultEncoding_IDLE 3'b000
`define UartCtrlTxState_defaultEncoding_START 3'b001
`define UartCtrlTxState_defaultEncoding_DATA 3'b010
`define UartCtrlTxState_defaultEncoding_PARITY 3'b011
`define UartCtrlTxState_defaultEncoding_STOP 3'b100

`define UartCtrlRxState_defaultEncoding_type [2:0]
`define UartCtrlRxState_defaultEncoding_IDLE 3'b000
`define UartCtrlRxState_defaultEncoding_START 3'b001
`define UartCtrlRxState_defaultEncoding_DATA 3'b010
`define UartCtrlRxState_defaultEncoding_PARITY 3'b011
`define UartCtrlRxState_defaultEncoding_STOP 3'b100


module MicroRV32Top (
  output     [7:0]    io_gpioLed,
  output              io_cpuFetch,
  output              io_cpuHalted,
  output     [2:0]    io_cpuDbgState,
  output     [15:0]   io_dbgBus,
  output              io_uart_txd,
  input               io_uart_rxd,
  input               clk,
  input               reset
);
  reg                 _zz_3;
  reg                 _zz_4;
  reg                 _zz_5;
  reg                 _zz_6;
  reg                 _zz_7;
  wire                cpu_io_sb_SBvalid;
  wire       [31:0]   cpu_io_sb_SBaddress;
  wire       [31:0]   cpu_io_sb_SBwdata;
  wire                cpu_io_sb_SBwrite;
  wire       [3:0]    cpu_io_sb_SBsize;
  wire                cpu_io_halted;
  wire                cpu_io_fetchSync;
  wire       [2:0]    cpu_io_dbgState;
  wire                ram_io_sb_SBready;
  wire       [31:0]   ram_io_sb_SBrdata;
  wire                gpio_led_io_sb_SBready;
  wire       [31:0]   gpio_led_io_sb_SBrdata;
  wire       [7:0]    gpio_led_io_leds;
  wire                shutdown_periph_io_sb_SBready;
  wire       [31:0]   shutdown_periph_io_sb_SBrdata;
  wire                shutdown_periph_io_halt;
  wire                shutdown_periph_io_haltErr;
  wire                uartPeriph_io_sb_SBready;
  wire       [31:0]   uartPeriph_io_sb_SBrdata;
  wire                uartPeriph_io_uart_txd;
  wire                rvCLIC_1_io_irq;
  wire                rvCLIC_1_io_sb_SBready;
  wire       [31:0]   rvCLIC_1_io_sb_SBrdata;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                intconSBready;
  wire       [31:0]   intconSBrdata;
  reg        [31:0]   addressMapping_oldAddr;
  reg                 addressMapping_lastValid;
  reg        [3:0]    addressMapping_datasel;
  reg                 _zz_1;
  reg        [31:0]   _zz_2;

  assign _zz_8 = (((32'h80000000 <= cpu_io_sb_SBaddress) && (cpu_io_sb_SBaddress <= 32'h80ffffff)) || ((32'h80000000 <= addressMapping_oldAddr) && (addressMapping_oldAddr <= 32'h80ffffff)));
  assign _zz_9 = (((32'h81000000 <= cpu_io_sb_SBaddress) && (cpu_io_sb_SBaddress <= 32'h8100000f)) || ((32'h81000000 <= addressMapping_oldAddr) && (addressMapping_oldAddr <= 32'h8100000f)));
  assign _zz_10 = (((32'h82000000 <= cpu_io_sb_SBaddress) && (cpu_io_sb_SBaddress <= 32'h820000ff)) || ((32'h82000000 <= addressMapping_oldAddr) && (addressMapping_oldAddr <= 32'h820000ff)));
  assign _zz_11 = (((32'h02000000 <= cpu_io_sb_SBaddress) && (cpu_io_sb_SBaddress <= 32'h0200ffff)) || ((32'h02000000 <= addressMapping_oldAddr) && (addressMapping_oldAddr <= 32'h0200ffff)));
  assign _zz_12 = (((32'h02010000 <= cpu_io_sb_SBaddress) && (cpu_io_sb_SBaddress <= 32'h020103ff)) || ((32'h02010000 <= addressMapping_oldAddr) && (addressMapping_oldAddr <= 32'h020103ff)));
  RV32Core cpu (
    .io_sb_SBaddress    (cpu_io_sb_SBaddress[31:0]   ), //o
    .io_sb_SBvalid      (cpu_io_sb_SBvalid           ), //o
    .io_sb_SBwdata      (cpu_io_sb_SBwdata[31:0]     ), //o
    .io_sb_SBwrite      (cpu_io_sb_SBwrite           ), //o
    .io_sb_SBsize       (cpu_io_sb_SBsize[3:0]       ), //o
    .io_sb_SBready      (intconSBready               ), //i
    .io_sb_SBrdata      (intconSBrdata[31:0]         ), //i
    .io_halted          (cpu_io_halted               ), //o
    .io_fetchSync       (cpu_io_fetchSync            ), //o
    .io_halt            (shutdown_periph_io_halt     ), //i
    .io_haltErr         (shutdown_periph_io_haltErr  ), //i
    .io_dbgState        (cpu_io_dbgState[2:0]        ), //o
    .io_irqTimer        (rvCLIC_1_io_irq             ), //i
    .clk                (clk                         ), //i
    .reset              (reset                       )  //i
  );
  Memory ram (
    .io_sb_SBaddress    (cpu_io_sb_SBaddress[31:0]  ), //i
    .io_sb_SBvalid      (cpu_io_sb_SBvalid          ), //i
    .io_sb_SBwdata      (cpu_io_sb_SBwdata[31:0]    ), //i
    .io_sb_SBwrite      (cpu_io_sb_SBwrite          ), //i
    .io_sb_SBsize       (cpu_io_sb_SBsize[3:0]      ), //i
    .io_sb_SBready      (ram_io_sb_SBready          ), //o
    .io_sb_SBrdata      (ram_io_sb_SBrdata[31:0]    ), //o
    .io_sel             (_zz_3                      ), //i
    .clk                (clk                        ), //i
    .reset              (reset                      )  //i
  );
  GPIOLED gpio_led (
    .io_sb_SBaddress    (cpu_io_sb_SBaddress[31:0]     ), //i
    .io_sb_SBvalid      (cpu_io_sb_SBvalid             ), //i
    .io_sb_SBwdata      (cpu_io_sb_SBwdata[31:0]       ), //i
    .io_sb_SBwrite      (cpu_io_sb_SBwrite             ), //i
    .io_sb_SBsize       (cpu_io_sb_SBsize[3:0]         ), //i
    .io_sb_SBready      (gpio_led_io_sb_SBready        ), //o
    .io_sb_SBrdata      (gpio_led_io_sb_SBrdata[31:0]  ), //o
    .io_leds            (gpio_led_io_leds[7:0]         ), //o
    .io_sel             (_zz_4                         ), //i
    .clk                (clk                           ), //i
    .reset              (reset                         )  //i
  );
  Shutdown shutdown_periph (
    .io_sb_SBaddress    (cpu_io_sb_SBaddress[31:0]            ), //i
    .io_sb_SBvalid      (cpu_io_sb_SBvalid                    ), //i
    .io_sb_SBwdata      (cpu_io_sb_SBwdata[31:0]              ), //i
    .io_sb_SBwrite      (cpu_io_sb_SBwrite                    ), //i
    .io_sb_SBsize       (cpu_io_sb_SBsize[3:0]                ), //i
    .io_sb_SBready      (shutdown_periph_io_sb_SBready        ), //o
    .io_sb_SBrdata      (shutdown_periph_io_sb_SBrdata[31:0]  ), //o
    .io_sel             (_zz_5                                ), //i
    .io_halt            (shutdown_periph_io_halt              ), //o
    .io_haltErr         (shutdown_periph_io_haltErr           ), //o
    .clk                (clk                                  ), //i
    .reset              (reset                                )  //i
  );
  SBUart uartPeriph (
    .io_sb_SBaddress    (cpu_io_sb_SBaddress[31:0]       ), //i
    .io_sb_SBvalid      (cpu_io_sb_SBvalid               ), //i
    .io_sb_SBwdata      (cpu_io_sb_SBwdata[31:0]         ), //i
    .io_sb_SBwrite      (cpu_io_sb_SBwrite               ), //i
    .io_sb_SBsize       (cpu_io_sb_SBsize[3:0]           ), //i
    .io_sb_SBready      (uartPeriph_io_sb_SBready        ), //o
    .io_sb_SBrdata      (uartPeriph_io_sb_SBrdata[31:0]  ), //o
    .io_uart_txd        (uartPeriph_io_uart_txd          ), //o
    .io_uart_rxd        (io_uart_rxd                     ), //i
    .io_sel             (_zz_6                           ), //i
    .clk                (clk                             ), //i
    .reset              (reset                           )  //i
  );
  RVCLIC rvCLIC_1 (
    .io_irq             (rvCLIC_1_io_irq               ), //o
    .io_sb_SBaddress    (cpu_io_sb_SBaddress[31:0]     ), //i
    .io_sb_SBvalid      (cpu_io_sb_SBvalid             ), //i
    .io_sb_SBwdata      (cpu_io_sb_SBwdata[31:0]       ), //i
    .io_sb_SBwrite      (cpu_io_sb_SBwrite             ), //i
    .io_sb_SBsize       (cpu_io_sb_SBsize[3:0]         ), //i
    .io_sb_SBready      (rvCLIC_1_io_sb_SBready        ), //o
    .io_sb_SBrdata      (rvCLIC_1_io_sb_SBrdata[31:0]  ), //o
    .io_sel             (_zz_7                         ), //i
    .clk                (clk                           ), //i
    .reset              (reset                         )  //i
  );
  always @ (*) begin
    _zz_3 = 1'b0;
    if(_zz_8)begin
      _zz_3 = 1'b1;
    end
    if(_zz_9)begin
      _zz_3 = 1'b0;
    end
    if(_zz_10)begin
      _zz_3 = 1'b0;
    end
    if(_zz_11)begin
      _zz_3 = 1'b0;
    end
    if(_zz_12)begin
      _zz_3 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_4 = 1'b0;
    if(_zz_8)begin
      _zz_4 = 1'b0;
    end
    if(_zz_9)begin
      _zz_4 = 1'b1;
    end
    if(_zz_10)begin
      _zz_4 = 1'b0;
    end
    if(_zz_11)begin
      _zz_4 = 1'b0;
    end
    if(_zz_12)begin
      _zz_4 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_5 = 1'b0;
    if(_zz_8)begin
      _zz_5 = 1'b0;
    end
    if(_zz_9)begin
      _zz_5 = 1'b0;
    end
    if(_zz_10)begin
      _zz_5 = 1'b0;
    end
    if(_zz_11)begin
      _zz_5 = 1'b0;
    end
    if(_zz_12)begin
      _zz_5 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_6 = 1'b0;
    if(_zz_8)begin
      _zz_6 = 1'b0;
    end
    if(_zz_9)begin
      _zz_6 = 1'b0;
    end
    if(_zz_10)begin
      _zz_6 = 1'b1;
    end
    if(_zz_11)begin
      _zz_6 = 1'b0;
    end
    if(_zz_12)begin
      _zz_6 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_7 = 1'b0;
    if(_zz_8)begin
      _zz_7 = 1'b0;
    end
    if(_zz_9)begin
      _zz_7 = 1'b0;
    end
    if(_zz_10)begin
      _zz_7 = 1'b0;
    end
    if(_zz_11)begin
      _zz_7 = 1'b1;
    end
    if(_zz_12)begin
      _zz_7 = 1'b0;
    end
  end

  always @ (*) begin
    addressMapping_datasel = 4'b0000;
    if(_zz_8)begin
      addressMapping_datasel = 4'b0001;
    end
    if(_zz_9)begin
      addressMapping_datasel = 4'b0010;
    end
    if(_zz_10)begin
      addressMapping_datasel = 4'b0100;
    end
    if(_zz_11)begin
      addressMapping_datasel = 4'b0101;
    end
    if(_zz_12)begin
      addressMapping_datasel = 4'b0011;
    end
  end

  always @ (*) begin
    case(addressMapping_datasel)
      4'b0000 : begin
        _zz_1 = 1'b0;
      end
      4'b0001 : begin
        _zz_1 = ram_io_sb_SBready;
      end
      4'b0010 : begin
        _zz_1 = gpio_led_io_sb_SBready;
      end
      4'b0011 : begin
        _zz_1 = shutdown_periph_io_sb_SBready;
      end
      4'b0100 : begin
        _zz_1 = uartPeriph_io_sb_SBready;
      end
      4'b0101 : begin
        _zz_1 = rvCLIC_1_io_sb_SBready;
      end
      default : begin
        _zz_1 = 1'b0;
      end
    endcase
  end

  assign intconSBready = _zz_1;
  always @ (*) begin
    case(addressMapping_datasel)
      4'b0000 : begin
        _zz_2 = 32'h0;
      end
      4'b0001 : begin
        _zz_2 = ram_io_sb_SBrdata;
      end
      4'b0010 : begin
        _zz_2 = gpio_led_io_sb_SBrdata;
      end
      4'b0011 : begin
        _zz_2 = shutdown_periph_io_sb_SBrdata;
      end
      4'b0100 : begin
        _zz_2 = uartPeriph_io_sb_SBrdata;
      end
      4'b0101 : begin
        _zz_2 = rvCLIC_1_io_sb_SBrdata;
      end
      default : begin
        _zz_2 = 32'h0;
      end
    endcase
  end

  assign intconSBrdata = _zz_2;
  assign io_cpuFetch = cpu_io_fetchSync;
  assign io_cpuHalted = cpu_io_halted;
  assign io_cpuDbgState = cpu_io_dbgState;
  assign io_gpioLed = gpio_led_io_leds;
  assign io_dbgBus = cpu_io_sb_SBaddress[15 : 0];
  assign io_uart_txd = uartPeriph_io_uart_txd;
  always @ (posedge clk) begin
    if(cpu_io_sb_SBvalid)begin
      addressMapping_oldAddr <= cpu_io_sb_SBaddress;
    end
    addressMapping_lastValid <= cpu_io_sb_SBvalid;
  end


endmodule

module RVCLIC (
  output              io_irq,
  input      [31:0]   io_sb_SBaddress,
  input               io_sb_SBvalid,
  input      [31:0]   io_sb_SBwdata,
  input               io_sb_SBwrite,
  input      [3:0]    io_sb_SBsize,
  output              io_sb_SBready,
  output     [31:0]   io_sb_SBrdata,
  input               io_sel,
  input               clk,
  input               reset
);
  wire       [15:0]   _zz_1;
  wire       [15:0]   _zz_2;
  wire       [15:0]   _zz_3;
  wire       [31:0]   _zz_4;
  wire       [15:0]   _zz_5;
  wire       [31:0]   _zz_6;
  wire       [15:0]   _zz_7;
  wire       [31:0]   _zz_8;
  wire       [15:0]   _zz_9;
  wire       [31:0]   _zz_10;
  wire       [15:0]   _zz_11;
  wire       [31:0]   _zz_12;
  wire       [15:0]   _zz_13;
  wire       [31:0]   _zz_14;
  wire       [15:0]   MTIME_BASE;
  wire       [15:0]   MTIMECMP_BASE;
  reg                 rdy;
  wire       [15:0]   intAddr;
  wire                read;
  wire                write;
  reg        [63:0]   mtime;
  reg        [63:0]   mtimecmp;
  reg                 timerIRQOut;
  reg        [31:0]   SBClicLogic_sbDataOutputReg;

  assign _zz_1 = (MTIME_BASE + 16'h0);
  assign _zz_2 = (MTIME_BASE + 16'h0004);
  assign _zz_3 = (MTIMECMP_BASE + 16'h0);
  assign _zz_4 = io_sb_SBwdata;
  assign _zz_5 = (MTIMECMP_BASE + 16'h0004);
  assign _zz_6 = io_sb_SBwdata;
  assign _zz_7 = (MTIME_BASE + 16'h0);
  assign _zz_8 = mtime[31 : 0];
  assign _zz_9 = (MTIME_BASE + 16'h0004);
  assign _zz_10 = mtime[63 : 32];
  assign _zz_11 = (MTIMECMP_BASE + 16'h0);
  assign _zz_12 = mtimecmp[31 : 0];
  assign _zz_13 = (MTIMECMP_BASE + 16'h0004);
  assign _zz_14 = mtimecmp[63 : 32];
  assign MTIME_BASE = 16'hbff8;
  assign MTIMECMP_BASE = 16'h4000;
  assign read = ((io_sb_SBvalid && io_sel) && (! io_sb_SBwrite));
  assign write = ((io_sb_SBvalid && io_sel) && io_sb_SBwrite);
  assign intAddr = io_sb_SBaddress[15 : 0];
  assign io_sb_SBready = rdy;
  assign io_sb_SBrdata = SBClicLogic_sbDataOutputReg;
  assign io_irq = timerIRQOut;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      rdy <= 1'b0;
      mtime <= 64'h0;
      mtimecmp <= 64'h0;
      timerIRQOut <= 1'b0;
      SBClicLogic_sbDataOutputReg <= 32'h0;
    end else begin
      mtime <= (mtime + 64'h0000000000000001);
      if((mtimecmp <= mtime))begin
        timerIRQOut <= 1'b1;
      end else begin
        timerIRQOut <= 1'b0;
      end
      SBClicLogic_sbDataOutputReg <= 32'h0;
      if(write)begin
        if(! (intAddr == _zz_1)) begin
          if(! (intAddr == _zz_2)) begin
            if((intAddr == _zz_3))begin
              mtimecmp[31 : 0] <= _zz_4;
            end else begin
              if((intAddr == _zz_5))begin
                mtimecmp[63 : 32] <= _zz_6;
              end
            end
          end
        end
      end else begin
        if(read)begin
          if((intAddr == _zz_7))begin
            SBClicLogic_sbDataOutputReg <= _zz_8;
          end else begin
            if((intAddr == _zz_9))begin
              SBClicLogic_sbDataOutputReg <= _zz_10;
            end else begin
              if((intAddr == _zz_11))begin
                SBClicLogic_sbDataOutputReg <= _zz_12;
              end else begin
                if((intAddr == _zz_13))begin
                  SBClicLogic_sbDataOutputReg <= _zz_14;
                end
              end
            end
          end
        end
      end
      rdy <= 1'b0;
      if(((read || write) && io_sel))begin
        rdy <= 1'b1;
      end
    end
  end


endmodule

module SBUart (
  input      [31:0]   io_sb_SBaddress,
  input               io_sb_SBvalid,
  input      [31:0]   io_sb_SBwdata,
  input               io_sb_SBwrite,
  input      [3:0]    io_sb_SBsize,
  output              io_sb_SBready,
  output     [31:0]   io_sb_SBrdata,
  output              io_uart_txd,
  input               io_uart_rxd,
  input               io_sel,
  input               clk,
  input               reset
);
  wire       [2:0]    _zz_10;
  wire       `UartStopType_defaultEncoding_type _zz_11;
  wire       `UartParityType_defaultEncoding_type _zz_12;
  wire       [19:0]   _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire                streamFifo_1_io_push_ready;
  wire                streamFifo_1_io_pop_valid;
  wire       [7:0]    streamFifo_1_io_pop_payload;
  wire       [4:0]    streamFifo_1_io_occupancy;
  wire       [4:0]    streamFifo_1_io_availability;
  wire                _zz_16;
  wire                _zz_17;
  wire                _zz_18;
  wire       [0:0]    _zz_19;
  wire       [4:0]    _zz_20;
  wire       [0:0]    _zz_21;
  wire       [0:0]    _zz_22;
  reg                 rdy;
  wire       [7:0]    intAddr;
  wire                read;
  wire                write;
  wire                _zz_1;
  reg                 _zz_2;
  reg        [7:0]    _zz_3;
  reg                 _zz_4;
  reg        [31:0]   _zz_5;
  reg                 _zz_6;
  wire                _zz_7;
  reg                 _zz_8;
  reg        [7:0]    _zz_9;

  assign _zz_16 = (intAddr == 8'h0);
  assign _zz_17 = (intAddr == 8'h04);
  assign _zz_18 = (intAddr == 8'h08);
  assign _zz_19 = _zz_4;
  assign _zz_20 = streamFifo_1_io_occupancy;
  assign _zz_21 = (streamFifo_1_io_occupancy == 5'h01);
  assign _zz_22 = (streamFifo_1_io_occupancy == 5'h0);
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength    (_zz_10[2:0]                      ), //i
    .io_config_frame_stop          (_zz_11                           ), //i
    .io_config_frame_parity        (_zz_12[1:0]                      ), //i
    .io_config_clockDivider        (_zz_13[19:0]                     ), //i
    .io_write_valid                (_zz_7                            ), //i
    .io_write_ready                (uartCtrl_1_io_write_ready        ), //o
    .io_write_payload              (_zz_9[7:0]                       ), //i
    .io_read_valid                 (uartCtrl_1_io_read_valid         ), //o
    .io_read_ready                 (streamFifo_1_io_push_ready       ), //i
    .io_read_payload               (uartCtrl_1_io_read_payload[7:0]  ), //o
    .io_uart_txd                   (uartCtrl_1_io_uart_txd           ), //o
    .io_uart_rxd                   (io_uart_rxd                      ), //i
    .io_readError                  (uartCtrl_1_io_readError          ), //o
    .io_writeBreak                 (_zz_14                           ), //i
    .io_readBreak                  (uartCtrl_1_io_readBreak          ), //o
    .clk                           (clk                              ), //i
    .reset                         (reset                            )  //i
  );
  StreamFifo streamFifo_1 (
    .io_push_valid      (uartCtrl_1_io_read_valid           ), //i
    .io_push_ready      (streamFifo_1_io_push_ready         ), //o
    .io_push_payload    (uartCtrl_1_io_read_payload[7:0]    ), //i
    .io_pop_valid       (streamFifo_1_io_pop_valid          ), //o
    .io_pop_ready       (_zz_6                              ), //i
    .io_pop_payload     (streamFifo_1_io_pop_payload[7:0]   ), //o
    .io_flush           (_zz_15                             ), //i
    .io_occupancy       (streamFifo_1_io_occupancy[4:0]     ), //o
    .io_availability    (streamFifo_1_io_availability[4:0]  ), //o
    .clk                (clk                                ), //i
    .reset              (reset                              )  //i
  );
  assign read = ((io_sb_SBvalid && io_sel) && (! io_sb_SBwrite));
  assign write = ((io_sb_SBvalid && io_sel) && io_sb_SBwrite);
  assign _zz_13 = 20'h0000c;
  assign _zz_10 = 3'b111;
  assign _zz_12 = `UartParityType_defaultEncoding_NONE;
  assign _zz_11 = `UartStopType_defaultEncoding_ONE;
  assign _zz_14 = 1'b0;
  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign intAddr = io_sb_SBaddress[7 : 0];
  assign _zz_1 = ((1'b1 && (! _zz_7)) || uartCtrl_1_io_write_ready);
  assign _zz_7 = _zz_8;
  always @ (*) begin
    _zz_6 = 1'b0;
    if(! write) begin
      if(read)begin
        if(! _zz_16) begin
          if(! _zz_17) begin
            if(_zz_18)begin
              _zz_6 = 1'b1;
            end
          end
        end
      end
    end
  end

  assign io_sb_SBready = rdy;
  assign io_sb_SBrdata = _zz_5;
  assign _zz_15 = 1'b0;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      rdy <= 1'b0;
      _zz_2 <= 1'b0;
      _zz_3 <= 8'h0;
      _zz_4 <= 1'b0;
      _zz_5 <= 32'h0;
      _zz_8 <= 1'b0;
    end else begin
      if(_zz_1)begin
        _zz_8 <= _zz_2;
      end
      _zz_5 <= 32'h0;
      _zz_2 <= 1'b0;
      _zz_4 <= _zz_1;
      if(write)begin
        if((intAddr == 8'h0))begin
          _zz_3 <= io_sb_SBwdata[7 : 0];
        end else begin
          if(((intAddr == 8'h04) && (io_sb_SBwdata == 32'h00000001)))begin
            _zz_2 <= 1'b1;
          end
        end
      end else begin
        if(read)begin
          if(! _zz_16) begin
            if(_zz_17)begin
              _zz_5 <= {31'd0, _zz_19};
            end else begin
              if(_zz_18)begin
                _zz_5 <= {24'd0, streamFifo_1_io_pop_payload};
              end else begin
                if((intAddr == 8'h0c))begin
                  _zz_5 <= {27'd0, _zz_20};
                end else begin
                  if((intAddr == 8'h10))begin
                    _zz_5 <= {31'd0, _zz_21};
                  end else begin
                    if((intAddr == 8'h14))begin
                      _zz_5 <= {31'd0, _zz_22};
                    end
                  end
                end
              end
            end
          end
        end
      end
      rdy <= 1'b0;
      if(((read || write) && io_sel))begin
        rdy <= 1'b1;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_1)begin
      _zz_9 <= _zz_3;
    end
  end


endmodule

module Shutdown (
  input      [31:0]   io_sb_SBaddress,
  input               io_sb_SBvalid,
  input      [31:0]   io_sb_SBwdata,
  input               io_sb_SBwrite,
  input      [3:0]    io_sb_SBsize,
  output              io_sb_SBready,
  output     [31:0]   io_sb_SBrdata,
  input               io_sel,
  output              io_halt,
  output              io_haltErr,
  input               clk,
  input               reset
);
  reg                 rdy;
  wire       [3:0]    intAddr;
  wire                read;
  wire                write;
  reg                 internalHalt;
  reg                 internalHaltErr;
  wire                haltCnd;

  assign intAddr = io_sb_SBaddress[3 : 0];
  assign read = ((io_sb_SBvalid && io_sel) && (! io_sb_SBwrite));
  assign write = ((io_sb_SBvalid && io_sel) && io_sb_SBwrite);
  assign haltCnd = ((io_sb_SBsize == 4'b0100) && (io_sb_SBwdata == 32'h0000005d));
  assign io_sb_SBready = rdy;
  assign io_sb_SBrdata = 32'h0;
  assign io_halt = internalHalt;
  assign io_haltErr = internalHaltErr;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      rdy <= 1'b0;
      internalHalt <= 1'b0;
      internalHaltErr <= 1'b0;
    end else begin
      if(write)begin
        if(((intAddr == 4'b0000) && haltCnd))begin
          internalHalt <= 1'b1;
        end else begin
          if(((intAddr == 4'b0100) && haltCnd))begin
            internalHaltErr <= 1'b1;
          end
        end
      end
      rdy <= 1'b0;
      if(((read || write) && io_sel))begin
        rdy <= 1'b1;
      end
    end
  end


endmodule

module GPIOLED (
  input      [31:0]   io_sb_SBaddress,
  input               io_sb_SBvalid,
  input      [31:0]   io_sb_SBwdata,
  input               io_sb_SBwrite,
  input      [3:0]    io_sb_SBsize,
  output              io_sb_SBready,
  output reg [31:0]   io_sb_SBrdata,
  output     [7:0]    io_leds,
  input               io_sel,
  input               clk,
  input               reset
);
  reg                 rdy;
  reg        [31:0]   led_out_val;
  wire       [3:0]    intAddr;
  wire                read;
  wire                write;

  assign intAddr = io_sb_SBaddress[3 : 0];
  assign read = ((io_sb_SBvalid && io_sel) && (! io_sb_SBwrite));
  assign write = ((io_sb_SBvalid && io_sel) && io_sb_SBwrite);
  always @ (*) begin
    io_sb_SBrdata = 32'h0;
    if(! write) begin
      if(read)begin
        if((intAddr == 4'b0000))begin
          io_sb_SBrdata = led_out_val;
        end
      end
    end
  end

  assign io_leds = led_out_val[7 : 0];
  assign io_sb_SBready = rdy;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      rdy <= 1'b0;
      led_out_val <= 32'h0;
    end else begin
      if(write)begin
        if((intAddr == 4'b0000))begin
          led_out_val <= io_sb_SBwdata;
        end
      end
      rdy <= 1'b0;
      if(((read || write) && io_sel))begin
        rdy <= 1'b1;
      end
    end
  end


endmodule

module Memory (
  input      [31:0]   io_sb_SBaddress,
  input               io_sb_SBvalid,
  input      [31:0]   io_sb_SBwdata,
  input               io_sb_SBwrite,
  input      [3:0]    io_sb_SBsize,
  output              io_sb_SBready,
  output     [31:0]   io_sb_SBrdata,
  input               io_sel,
  input               clk,
  input               reset
);
  reg        [31:0]   _zz_2;
  reg        [7:0]    _zz_3;
  reg        [15:0]   _zz_4;
  wire       [1:0]    _zz_5;
  wire       [0:0]    _zz_6;
  wire       [1:0]    _zz_7;
  wire       [0:0]    _zz_8;
  wire       [7:0]    _zz_9;
  wire       [15:0]   _zz_10;
  wire       [31:0]   _zz_11;
  wire       [1:0]    _zz_12;
  wire       [0:0]    _zz_13;
  reg                 rdy;
  wire                read;
  wire                write;
  wire       [12:0]   ramAddr;
  wire       [12:0]   internalAddress;
  reg        [3:0]    tSize;
  reg        [1:0]    alignment;
  wire       [31:0]   rdVal;
  wire       [7:0]    byteRD;
  wire       [15:0]   halfRD;
  reg        [31:0]   _zz_1;
  reg        [3:0]    bytemask;
  reg        [3:0]    halfmask;
  reg        [3:0]    writemask;
  reg        [31:0]   tmpData;
  reg        [4:0]    wByteShAmt;
  reg        [4:0]    wHalfShAmt;
  reg        [4:0]    wShift;
  wire       [62:0]   wdata;
  reg [7:0] memRam_symbol0 [0:4103];
  reg [7:0] memRam_symbol1 [0:4103];
  reg [7:0] memRam_symbol2 [0:4103];
  reg [7:0] memRam_symbol3 [0:4103];
  reg [7:0] _zz_14;
  reg [7:0] _zz_15;
  reg [7:0] _zz_16;
  reg [7:0] _zz_17;

  assign _zz_5 = ramAddr[1 : 0];
  assign _zz_6 = ramAddr[1 : 1];
  assign _zz_7 = ramAddr[1 : 0];
  assign _zz_8 = ramAddr[1 : 1];
  assign _zz_9 = io_sb_SBwdata[7 : 0];
  assign _zz_10 = io_sb_SBwdata[15 : 0];
  assign _zz_11 = tmpData;
  assign _zz_12 = alignment[1 : 0];
  assign _zz_13 = alignment[1 : 1];
  initial begin
    $readmemb("MicroRV32Top.v_toplevel_ram_memRam_symbol0.bin",memRam_symbol0);
    $readmemb("MicroRV32Top.v_toplevel_ram_memRam_symbol1.bin",memRam_symbol1);
    $readmemb("MicroRV32Top.v_toplevel_ram_memRam_symbol2.bin",memRam_symbol2);
    $readmemb("MicroRV32Top.v_toplevel_ram_memRam_symbol3.bin",memRam_symbol3);
  end
  always @ (*) begin
    _zz_2 = {_zz_17, _zz_16, _zz_15, _zz_14};
  end
  always @ (posedge clk) begin
    if(read) begin
      _zz_14 <= memRam_symbol0[internalAddress];
      _zz_15 <= memRam_symbol1[internalAddress];
      _zz_16 <= memRam_symbol2[internalAddress];
      _zz_17 <= memRam_symbol3[internalAddress];
    end
  end

  always @ (posedge clk) begin
    if(writemask[0] && write) begin
      memRam_symbol0[internalAddress] <= wdata[7 : 0];
    end
    if(writemask[1] && write) begin
      memRam_symbol1[internalAddress] <= wdata[15 : 8];
    end
    if(writemask[2] && write) begin
      memRam_symbol2[internalAddress] <= wdata[23 : 16];
    end
    if(writemask[3] && write) begin
      memRam_symbol3[internalAddress] <= wdata[31 : 24];
    end
  end

  always @(*) begin
    case(_zz_12)
      2'b00 : begin
        _zz_3 = rdVal[7 : 0];
      end
      2'b01 : begin
        _zz_3 = rdVal[15 : 8];
      end
      2'b10 : begin
        _zz_3 = rdVal[23 : 16];
      end
      default : begin
        _zz_3 = rdVal[31 : 24];
      end
    endcase
  end

  always @(*) begin
    case(_zz_13)
      1'b0 : begin
        _zz_4 = rdVal[15 : 0];
      end
      default : begin
        _zz_4 = rdVal[31 : 16];
      end
    endcase
  end

  assign read = ((io_sb_SBvalid && io_sel) && (! io_sb_SBwrite));
  assign write = ((io_sb_SBvalid && io_sel) && io_sb_SBwrite);
  assign ramAddr = io_sb_SBaddress[12 : 0];
  assign internalAddress = (ramAddr / 3'b100);
  assign rdVal = _zz_2;
  assign byteRD = _zz_3;
  assign halfRD = _zz_4;
  always @ (*) begin
    case(tSize)
      4'b0001 : begin
        _zz_1 = {24'd0, byteRD};
      end
      4'b0010 : begin
        _zz_1 = {16'd0, halfRD};
      end
      4'b0100 : begin
        _zz_1 = rdVal;
      end
      default : begin
        _zz_1 = rdVal;
      end
    endcase
  end

  assign io_sb_SBrdata = _zz_1;
  always @ (*) begin
    case(_zz_5)
      2'b00 : begin
        bytemask = 4'b0001;
      end
      2'b01 : begin
        bytemask = 4'b0010;
      end
      2'b10 : begin
        bytemask = 4'b0100;
      end
      default : begin
        bytemask = 4'b1000;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_6)
      1'b0 : begin
        halfmask = 4'b0011;
      end
      default : begin
        halfmask = 4'b1100;
      end
    endcase
  end

  always @ (*) begin
    case(io_sb_SBsize)
      4'b0001 : begin
        writemask = bytemask;
      end
      4'b0010 : begin
        writemask = halfmask;
      end
      4'b0100 : begin
        writemask = 4'b1111;
      end
      default : begin
        writemask = 4'b1111;
      end
    endcase
  end

  always @ (*) begin
    case(io_sb_SBsize)
      4'b0001 : begin
        tmpData = {24'd0, _zz_9};
      end
      4'b0010 : begin
        tmpData = {16'd0, _zz_10};
      end
      4'b0100 : begin
        tmpData = io_sb_SBwdata;
      end
      default : begin
        tmpData = io_sb_SBwdata;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_7)
      2'b00 : begin
        wByteShAmt = 5'h0;
      end
      2'b01 : begin
        wByteShAmt = 5'h08;
      end
      2'b10 : begin
        wByteShAmt = 5'h10;
      end
      default : begin
        wByteShAmt = 5'h18;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_8)
      1'b0 : begin
        wHalfShAmt = 5'h0;
      end
      default : begin
        wHalfShAmt = 5'h10;
      end
    endcase
  end

  always @ (*) begin
    case(io_sb_SBsize)
      4'b0001 : begin
        wShift = wByteShAmt;
      end
      4'b0010 : begin
        wShift = wHalfShAmt;
      end
      4'b0100 : begin
        wShift = 5'h0;
      end
      default : begin
        wShift = 5'h0;
      end
    endcase
  end

  assign wdata = ({31'd0,_zz_11} <<< wShift);
  assign io_sb_SBready = rdy;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      rdy <= 1'b0;
      tSize <= 4'b0000;
      alignment <= 2'b00;
    end else begin
      tSize <= io_sb_SBsize;
      alignment <= ramAddr[1 : 0];
      rdy <= 1'b0;
      if(((read || write) && io_sel))begin
        rdy <= 1'b1;
      end
    end
  end


endmodule

module RV32Core (
  output reg [31:0]   io_sb_SBaddress,
  output reg          io_sb_SBvalid,
  output reg [31:0]   io_sb_SBwdata,
  output reg          io_sb_SBwrite,
  output reg [3:0]    io_sb_SBsize,
  input               io_sb_SBready,
  input      [31:0]   io_sb_SBrdata,
  output              io_halted,
  output              io_fetchSync,
  input               io_halt,
  input               io_haltErr,
  output reg [2:0]    io_dbgState,
  input               io_irqTimer,
  input               clk,
  input               reset
);
  wire       [31:0]   regs_io_rs1Data;
  wire       [31:0]   regs_io_rs2Data;
  wire                _zz_17;
  wire                _zz_18;
  wire                _zz_19;
  wire                _zz_20;
  wire                _zz_21;
  wire                _zz_22;
  wire                _zz_23;
  wire                _zz_24;
  wire                _zz_25;
  wire                _zz_26;
  wire                _zz_27;
  wire                _zz_28;
  wire       [0:0]    _zz_29;
  wire       [20:0]   _zz_30;
  wire       [0:0]    _zz_31;
  wire       [19:0]   _zz_32;
  wire       [0:0]    _zz_33;
  wire       [20:0]   _zz_34;
  wire       [0:0]    _zz_35;
  wire       [20:0]   _zz_36;
  wire       [20:0]   _zz_37;
  wire       [31:0]   _zz_38;
  wire       [11:0]   _zz_39;
  wire       [31:0]   _zz_40;
  wire       [31:0]   _zz_41;
  wire       [31:0]   _zz_42;
  wire       [31:0]   _zz_43;
  wire       [31:0]   _zz_44;
  wire       [31:0]   _zz_45;
  wire       [31:0]   _zz_46;
  wire       [31:0]   _zz_47;
  wire       [31:0]   _zz_48;
  wire       [31:0]   _zz_49;
  wire       [31:0]   _zz_50;
  wire       [63:0]   _zz_51;
  wire       [31:0]   _zz_52;
  wire       [31:0]   _zz_53;
  wire       [31:0]   _zz_54;
  wire       [31:0]   _zz_55;
  wire       [31:0]   _zz_56;
  wire       [31:0]   _zz_57;
  wire       [31:0]   _zz_58;
  wire       [7:0]    _zz_59;
  wire       [31:0]   _zz_60;
  wire       [15:0]   _zz_61;
  wire       [31:0]   _zz_62;
  wire       [7:0]    _zz_63;
  wire       [31:0]   _zz_64;
  wire       [15:0]   _zz_65;
  wire       [31:0]   _zz_66;
  wire       [31:0]   _zz_67;
  wire       [31:0]   _zz_68;
  wire       [31:0]   _zz_69;
  wire       [31:0]   _zz_70;
  wire       [31:0]   _zz_71;
  wire       [31:0]   _zz_72;
  wire       [31:0]   _zz_73;
  wire       [63:0]   _zz_74;
  reg        [31:0]   pcLogic_programCounter;
  reg                 pcLogic_pcEna;
  reg        [31:0]   decodeLogic_instruction;
  wire       [31:0]   decodeLogic_instrSwapped;
  wire       [6:0]    decodeLogic_opcode;
  wire       [4:0]    decodeLogic_source1;
  wire       [4:0]    decodeLogic_source2;
  wire       [4:0]    decodeLogic_destination;
  reg        [31:0]   decodeLogic_immediate;
  wire       [2:0]    decodeLogic_funct3;
  wire       [6:0]    decodeLogic_funct7;
  wire       [11:0]   decodeLogic_funct12;
  wire       [4:0]    decodeLogic_shamt;
  wire       [11:0]   decodeLogic_csr;
  wire       [4:0]    decodeLogic_csr_uimm;
  reg                 decodeLogic_decoded;
  reg        `InstructionType_defaultEncoding_type decodeLogic_iType;
  reg        [31:0]   aluLogic_opA;
  reg        [31:0]   aluLogic_opB;
  reg        [31:0]   aluLogic_output;
  reg                 aluLogic_output_bool;
  wire       [31:0]   aluLogic_add;
  wire       [31:0]   aluLogic_sub;
  wire                aluLogic_equal;
  wire                aluLogic_unequal;
  wire                aluLogic_lt_u;
  wire                aluLogic_lt_s;
  wire                aluLogic_ge_u;
  wire                aluLogic_ge_s;
  wire       [31:0]   aluLogic_bitAnd;
  wire       [31:0]   aluLogic_bitOr;
  wire       [31:0]   aluLogic_bitXor;
  wire       [31:0]   aluLogic_shiftL;
  wire       [31:0]   aluLogic_shiftR;
  wire       [31:0]   aluLogic_shiftRA;
  wire       [31:0]   aluLogic_shiftLI;
  wire       [31:0]   aluLogic_shiftRI;
  wire       [31:0]   aluLogic_shiftRAI;
  wire       [11:0]   cssrLogic_addr;
  wire       `CSSRAccessType_defaultEncoding_type cssrLogic_accessType;
  reg                 cssrLogic_ena;
  wire       [31:0]   cssrLogic_wval;
  reg        [31:0]   cssrLogic_rval;
  wire                cssrLogic_newFetch;
  reg                 cssrLogic_isIllegalAccess;
  wire                cssrLogic_rdX0;
  wire                cssrLogic_rs1X0;
  wire                cssrLogic_uimmZero;
  wire                cssrLogic_chooseOperand;
  wire                cssrLogic_wrCSRcnd;
  wire       [31:0]   cssrLogic_mvendorid;
  wire       [31:0]   cssrLogic_marchid;
  wire       [31:0]   cssrLogic_mimpid;
  wire       [31:0]   cssrLogic_mhartid;
  reg        [31:0]   cssrLogic_mstatus;
  reg        [31:0]   _zz_1;
  wire       [31:0]   cssrLogic_misa;
  reg        [31:0]   _zz_2;
  reg        [31:0]   cssrLogic_medeleg;
  reg        [31:0]   cssrLogic_mideleg;
  reg        [31:0]   cssrLogic_mie;
  reg        [31:0]   cssrLogic_mtvec;
  reg        [31:0]   cssrLogic_mepc;
  reg        [31:0]   cssrLogic_mcause;
  reg        [31:0]   cssrLogic_mtval;
  reg        [31:0]   cssrLogic_mip;
  reg        [31:0]   cssrLogic_mtinst;
  reg        [63:0]   cssrLogic_minstret;
  reg        [63:0]   cssrLogic_mcycle;
  wire       [31:0]   _zz_3;
  wire       [31:0]   _zz_4;
  wire       [31:0]   _zz_5;
  wire       [31:0]   _zz_6;
  wire       [31:0]   _zz_7;
  wire       [31:0]   _zz_8;
  wire       [31:0]   _zz_9;
  wire       [31:0]   _zz_10;
  wire       [31:0]   _zz_11;
  wire       [31:0]   _zz_12;
  wire                controlFSM_wantExit;
  reg                 controlFSM_wantStart;
  reg                 controlFSM_memValid;
  wire                controlFSM_memReady;
  wire                controlFSM_memWrite;
  reg                 controlFSM_regWR;
  reg                 controlFSM_halted;
  reg                 controlFSM_fetchSync;
  wire                controlFSM_newFetch;
  wire                controlFSM_haltCond;
  wire                controlFSM_timerIRQPending;
  reg        [4:0]    datapathLogic_src1;
  reg        [4:0]    datapathLogic_src2;
  reg        [31:0]   datapathLogic_src1Data;
  reg        [31:0]   datapathLogic_src2Data;
  reg        [4:0]    datapathLogic_dest;
  reg        [31:0]   datapathLogic_destData;
  reg        [11:0]   datapathLogic_csr_addr;
  reg        `CSSRAccessType_defaultEncoding_type datapathLogic_csr_accType;
  wire                datapathLogic_csr_ena;
  wire       [31:0]   datapathLogic_csr_rval;
  reg        [31:0]   datapathLogic_csr_wval;
  reg        [31:0]   _zz_13;
  reg        [31:0]   _zz_14;
  reg        `controlFSM_enumDefinition_defaultEncoding_type controlFSM_stateReg;
  reg        `controlFSM_enumDefinition_defaultEncoding_type controlFSM_stateNext;
  wire                _zz_15;
  wire                _zz_16;
  `ifndef SYNTHESIS
  reg [95:0] decodeLogic_iType_string;
  reg [63:0] cssrLogic_accessType_string;
  reg [63:0] datapathLogic_csr_accType_string;
  reg [199:0] controlFSM_stateReg_string;
  reg [199:0] controlFSM_stateNext_string;
  `endif

  function [31:0] zz__zz_1(input dummy);
    begin
      zz__zz_1 = 32'h0;
      zz__zz_1[12 : 11] = 2'b11;
    end
  endfunction
  wire [31:0] _zz_75;
  function [31:0] zz__zz_2(input dummy);
    begin
      zz__zz_2 = 32'h0;
      zz__zz_2[31 : 30] = 2'b01;
      zz__zz_2[8] = 1'b1;
    end
  endfunction
  wire [31:0] _zz_76;
  function [31:0] zz__zz_13(input dummy);
    begin
      zz__zz_13 = 32'hffffffff;
      zz__zz_13[31] = 1'b0;
    end
  endfunction
  wire [31:0] _zz_77;
  function [31:0] zz__zz_14(input dummy);
    begin
      zz__zz_14 = 32'h0;
      zz__zz_14[31] = 1'b1;
    end
  endfunction
  wire [31:0] _zz_78;

  assign _zz_17 = (((((decodeLogic_funct12 & 12'hfff) == 12'h0) && (decodeLogic_source1 == 5'h0)) && (decodeLogic_funct3 == 3'b000)) && (decodeLogic_destination == 5'h0));
  assign _zz_18 = (((((decodeLogic_funct12 & 12'hfff) == 12'h302) && (decodeLogic_source1 == 5'h0)) && (decodeLogic_funct3 == 3'b000)) && (decodeLogic_destination == 5'h0));
  assign _zz_19 = (! ((decodeLogic_funct3 & 3'b011) == 3'b000));
  assign _zz_20 = (controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit);
  assign _zz_21 = (controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch);
  assign _zz_22 = (controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode);
  assign _zz_23 = (controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute);
  assign _zz_24 = ((decodeLogic_funct12 & 12'hfff) == 12'h0);
  assign _zz_25 = (((((decodeLogic_funct12 & 12'hfff) == 12'h302) && (decodeLogic_source1 == 5'h0)) && (decodeLogic_funct3 == 3'b000)) && (decodeLogic_destination == 5'h0));
  assign _zz_26 = (! ((decodeLogic_funct3 & 3'b011) == 3'b000));
  assign _zz_27 = (controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack);
  assign _zz_28 = (controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR);
  assign _zz_29 = decodeLogic_instrSwapped[31];
  assign _zz_30 = {{20{_zz_29[0]}}, _zz_29};
  assign _zz_31 = decodeLogic_instrSwapped[31];
  assign _zz_32 = {{19{_zz_31[0]}}, _zz_31};
  assign _zz_33 = decodeLogic_instrSwapped[31];
  assign _zz_34 = {{20{_zz_33[0]}}, _zz_33};
  assign _zz_35 = decodeLogic_instrSwapped[31];
  assign _zz_36 = {{20{_zz_35[0]}}, _zz_35};
  assign _zz_37 = {{{{{decodeLogic_instrSwapped[31],decodeLogic_instrSwapped[19 : 12]},decodeLogic_instrSwapped[20]},decodeLogic_instrSwapped[30 : 25]},decodeLogic_instrSwapped[24 : 21]},1'b0};
  assign _zz_38 = {{11{_zz_37[20]}}, _zz_37};
  assign _zz_39 = {{{decodeLogic_instrSwapped[31],decodeLogic_instrSwapped[30 : 25]},decodeLogic_instrSwapped[24 : 21]},decodeLogic_instrSwapped[20]};
  assign _zz_40 = {{20{_zz_39[11]}}, _zz_39};
  assign _zz_41 = (aluLogic_opA + aluLogic_opB);
  assign _zz_42 = (aluLogic_opA - aluLogic_opB);
  assign _zz_43 = aluLogic_opA;
  assign _zz_44 = aluLogic_opB;
  assign _zz_45 = aluLogic_opB;
  assign _zz_46 = aluLogic_opA;
  assign _zz_47 = ($signed(_zz_48) >>> aluLogic_opB[4 : 0]);
  assign _zz_48 = aluLogic_opA;
  assign _zz_49 = ($signed(_zz_50) >>> decodeLogic_shamt);
  assign _zz_50 = aluLogic_opA;
  assign _zz_51 = (cssrLogic_mcycle + 64'h0000000000000001);
  assign _zz_52 = (_zz_53 - 32'h00000004);
  assign _zz_53 = (decodeLogic_immediate + pcLogic_programCounter);
  assign _zz_54 = (pcLogic_programCounter + decodeLogic_immediate);
  assign _zz_55 = (datapathLogic_src1Data + decodeLogic_immediate);
  assign _zz_56 = (pcLogic_programCounter + decodeLogic_immediate);
  assign _zz_57 = (pcLogic_programCounter - 32'h00000004);
  assign _zz_58 = {27'd0, decodeLogic_csr_uimm};
  assign _zz_59 = io_sb_SBrdata[7 : 0];
  assign _zz_60 = {{24{_zz_59[7]}}, _zz_59};
  assign _zz_61 = io_sb_SBrdata[15 : 0];
  assign _zz_62 = {{16{_zz_61[15]}}, _zz_61};
  assign _zz_63 = io_sb_SBrdata[7 : 0];
  assign _zz_64 = {24'd0, _zz_63};
  assign _zz_65 = io_sb_SBrdata[15 : 0];
  assign _zz_66 = {16'd0, _zz_65};
  assign _zz_67 = (pcLogic_programCounter - 32'h00000004);
  assign _zz_68 = (pcLogic_programCounter - 32'h00000004);
  assign _zz_69 = _zz_70;
  assign _zz_70 = ({2'd0,cssrLogic_mtvec[31 : 2]} <<< 2);
  assign _zz_71 = (pcLogic_programCounter - 32'h00000004);
  assign _zz_72 = _zz_73;
  assign _zz_73 = ({2'd0,cssrLogic_mtvec[31 : 2]} <<< 2);
  assign _zz_74 = (cssrLogic_minstret + 64'h0000000000000001);
  RV32RegisterFile regs (
    .io_rs1        (datapathLogic_src1[4:0]       ), //i
    .io_rs2        (datapathLogic_src2[4:0]       ), //i
    .io_rs1Data    (regs_io_rs1Data[31:0]         ), //o
    .io_rs2Data    (regs_io_rs2Data[31:0]         ), //o
    .io_wrEna      (controlFSM_regWR              ), //i
    .io_rd         (datapathLogic_dest[4:0]       ), //i
    .io_rdData     (datapathLogic_destData[31:0]  ), //i
    .clk           (clk                           ), //i
    .reset         (reset                         )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decodeLogic_iType)
      `InstructionType_defaultEncoding_isUndef : decodeLogic_iType_string = "isUndef     ";
      `InstructionType_defaultEncoding_isRegReg : decodeLogic_iType_string = "isRegReg    ";
      `InstructionType_defaultEncoding_isRegImm : decodeLogic_iType_string = "isRegImm    ";
      `InstructionType_defaultEncoding_isImm : decodeLogic_iType_string = "isImm       ";
      `InstructionType_defaultEncoding_isBranch : decodeLogic_iType_string = "isBranch    ";
      `InstructionType_defaultEncoding_isLoad : decodeLogic_iType_string = "isLoad      ";
      `InstructionType_defaultEncoding_isStore : decodeLogic_iType_string = "isStore     ";
      `InstructionType_defaultEncoding_isCT_JAL : decodeLogic_iType_string = "isCT_JAL    ";
      `InstructionType_defaultEncoding_isCT_JALR : decodeLogic_iType_string = "isCT_JALR   ";
      `InstructionType_defaultEncoding_isLUI : decodeLogic_iType_string = "isLUI       ";
      `InstructionType_defaultEncoding_isAUIPC : decodeLogic_iType_string = "isAUIPC     ";
      `InstructionType_defaultEncoding_isECall : decodeLogic_iType_string = "isECall     ";
      `InstructionType_defaultEncoding_isFence : decodeLogic_iType_string = "isFence     ";
      `InstructionType_defaultEncoding_isIllegal : decodeLogic_iType_string = "isIllegal   ";
      `InstructionType_defaultEncoding_isCSR : decodeLogic_iType_string = "isCSR       ";
      `InstructionType_defaultEncoding_isCSRImm : decodeLogic_iType_string = "isCSRImm    ";
      `InstructionType_defaultEncoding_isTrapReturn : decodeLogic_iType_string = "isTrapReturn";
      default : decodeLogic_iType_string = "????????????";
    endcase
  end
  always @(*) begin
    case(cssrLogic_accessType)
      `CSSRAccessType_defaultEncoding_CSRidle : cssrLogic_accessType_string = "CSRidle ";
      `CSSRAccessType_defaultEncoding_CSRread : cssrLogic_accessType_string = "CSRread ";
      `CSSRAccessType_defaultEncoding_CSRwrite : cssrLogic_accessType_string = "CSRwrite";
      `CSSRAccessType_defaultEncoding_CSRset : cssrLogic_accessType_string = "CSRset  ";
      `CSSRAccessType_defaultEncoding_CSRclear : cssrLogic_accessType_string = "CSRclear";
      default : cssrLogic_accessType_string = "????????";
    endcase
  end
  always @(*) begin
    case(datapathLogic_csr_accType)
      `CSSRAccessType_defaultEncoding_CSRidle : datapathLogic_csr_accType_string = "CSRidle ";
      `CSSRAccessType_defaultEncoding_CSRread : datapathLogic_csr_accType_string = "CSRread ";
      `CSSRAccessType_defaultEncoding_CSRwrite : datapathLogic_csr_accType_string = "CSRwrite";
      `CSSRAccessType_defaultEncoding_CSRset : datapathLogic_csr_accType_string = "CSRset  ";
      `CSSRAccessType_defaultEncoding_CSRclear : datapathLogic_csr_accType_string = "CSRclear";
      default : datapathLogic_csr_accType_string = "????????";
    endcase
  end
  always @(*) begin
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_BOOT : controlFSM_stateReg_string = "controlFSM_BOOT          ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : controlFSM_stateReg_string = "controlFSM_stateInit     ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : controlFSM_stateReg_string = "controlFSM_stateFetch    ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : controlFSM_stateReg_string = "controlFSM_stateDecode   ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : controlFSM_stateReg_string = "controlFSM_stateExecute  ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : controlFSM_stateReg_string = "controlFSM_stateWriteBack";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : controlFSM_stateReg_string = "controlFSM_stateTrap     ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : controlFSM_stateReg_string = "controlFSM_stateCSR      ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : controlFSM_stateReg_string = "controlFSM_stateInterrupt";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : controlFSM_stateReg_string = "controlFSM_stateHalt     ";
      default : controlFSM_stateReg_string = "?????????????????????????";
    endcase
  end
  always @(*) begin
    case(controlFSM_stateNext)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_BOOT : controlFSM_stateNext_string = "controlFSM_BOOT          ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : controlFSM_stateNext_string = "controlFSM_stateInit     ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : controlFSM_stateNext_string = "controlFSM_stateFetch    ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : controlFSM_stateNext_string = "controlFSM_stateDecode   ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : controlFSM_stateNext_string = "controlFSM_stateExecute  ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : controlFSM_stateNext_string = "controlFSM_stateWriteBack";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : controlFSM_stateNext_string = "controlFSM_stateTrap     ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : controlFSM_stateNext_string = "controlFSM_stateCSR      ";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : controlFSM_stateNext_string = "controlFSM_stateInterrupt";
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : controlFSM_stateNext_string = "controlFSM_stateHalt     ";
      default : controlFSM_stateNext_string = "?????????????????????????";
    endcase
  end
  `endif

  always @ (*) begin
    decodeLogic_iType = `InstructionType_defaultEncoding_isUndef;
    if((((decodeLogic_opcode & 7'h7f) == 7'h33))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isRegReg;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h13))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isRegImm;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h63))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isBranch;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h03))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isLoad;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h23))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isStore;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h37))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isLUI;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h17))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isAUIPC;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h6f))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isCT_JAL;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h67))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isCT_JALR;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h0f))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isFence;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h73)) || (((decodeLogic_opcode & 7'h7f) == 7'h73))) begin
        if(_zz_17)begin
          decodeLogic_iType = `InstructionType_defaultEncoding_isECall;
        end else begin
          if(_zz_18)begin
            decodeLogic_iType = `InstructionType_defaultEncoding_isTrapReturn;
          end else begin
            if(_zz_19)begin
              decodeLogic_iType = `InstructionType_defaultEncoding_isCSR;
              if(decodeLogic_funct3[2])begin
                decodeLogic_iType = `InstructionType_defaultEncoding_isCSRImm;
              end
            end
          end
        end
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h0))) begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isIllegal;
    end else begin
        decodeLogic_iType = `InstructionType_defaultEncoding_isUndef;
    end
  end

  always @ (*) begin
    decodeLogic_decoded = 1'b0;
    if((((decodeLogic_opcode & 7'h7f) == 7'h33))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h13))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h63))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h03))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h23))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h37))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h17))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h6f))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h67))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h0f))) begin
        decodeLogic_decoded = 1'b1;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h73)) || (((decodeLogic_opcode & 7'h7f) == 7'h73))) begin
        if(_zz_17)begin
          decodeLogic_decoded = 1'b1;
        end else begin
          if(_zz_18)begin
            decodeLogic_decoded = 1'b1;
          end else begin
            if(_zz_19)begin
              decodeLogic_decoded = 1'b1;
            end
          end
        end
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h0))) begin
        decodeLogic_decoded = 1'b0;
    end else begin
        decodeLogic_decoded = 1'b0;
    end
  end

  assign decodeLogic_instrSwapped = decodeLogic_instruction;
  assign decodeLogic_opcode = decodeLogic_instrSwapped[6 : 0];
  assign decodeLogic_source1 = decodeLogic_instrSwapped[19 : 15];
  assign decodeLogic_source2 = decodeLogic_instrSwapped[24 : 20];
  assign decodeLogic_destination = decodeLogic_instrSwapped[11 : 7];
  assign decodeLogic_funct3 = decodeLogic_instrSwapped[14 : 12];
  assign decodeLogic_funct7 = decodeLogic_instrSwapped[31 : 25];
  assign decodeLogic_funct12 = decodeLogic_instrSwapped[31 : 20];
  always @ (*) begin
    decodeLogic_immediate = 32'h0;
    if((((decodeLogic_opcode & 7'h7f) == 7'h33))) begin
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h13))) begin
        decodeLogic_immediate = {{{_zz_30,decodeLogic_instrSwapped[30 : 25]},decodeLogic_instrSwapped[24 : 21]},decodeLogic_instrSwapped[20]};
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h63))) begin
        decodeLogic_immediate = {{{{_zz_32,decodeLogic_instrSwapped[7]},decodeLogic_instrSwapped[30 : 25]},decodeLogic_instrSwapped[11 : 8]},1'b0};
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h03))) begin
        decodeLogic_immediate = {{{_zz_34,decodeLogic_instrSwapped[30 : 25]},decodeLogic_instrSwapped[24 : 21]},decodeLogic_instrSwapped[20]};
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h23))) begin
        decodeLogic_immediate = {{{_zz_36,decodeLogic_instrSwapped[30 : 25]},decodeLogic_instrSwapped[11 : 8]},decodeLogic_instrSwapped[7]};
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h37))) begin
        decodeLogic_immediate = {{{decodeLogic_instrSwapped[31],decodeLogic_instrSwapped[30 : 20]},decodeLogic_instrSwapped[19 : 12]},12'h0};
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h17))) begin
        decodeLogic_immediate = {{{decodeLogic_instrSwapped[31],decodeLogic_instrSwapped[30 : 20]},decodeLogic_instrSwapped[19 : 12]},12'h0};
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h6f))) begin
        decodeLogic_immediate = _zz_38;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h67))) begin
        decodeLogic_immediate = _zz_40;
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h0f))) begin
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h73)) || (((decodeLogic_opcode & 7'h7f) == 7'h73))) begin
    end else if((((decodeLogic_opcode & 7'h7f) == 7'h0))) begin
    end else begin
    end
  end

  assign decodeLogic_shamt = decodeLogic_instrSwapped[24 : 20];
  assign decodeLogic_csr = decodeLogic_instrSwapped[31 : 20];
  assign decodeLogic_csr_uimm = decodeLogic_instrSwapped[19 : 15];
  assign aluLogic_add = _zz_41;
  assign aluLogic_sub = _zz_42;
  assign aluLogic_equal = (aluLogic_opA == aluLogic_opB);
  assign aluLogic_unequal = (! aluLogic_equal);
  assign aluLogic_lt_u = (aluLogic_opA < aluLogic_opB);
  assign aluLogic_lt_s = ($signed(_zz_43) < $signed(_zz_44));
  assign aluLogic_ge_u = (aluLogic_opB <= aluLogic_opA);
  assign aluLogic_ge_s = ($signed(_zz_45) <= $signed(_zz_46));
  assign aluLogic_bitAnd = (aluLogic_opA & aluLogic_opB);
  assign aluLogic_bitOr = (aluLogic_opA | aluLogic_opB);
  assign aluLogic_bitXor = (aluLogic_opA ^ aluLogic_opB);
  assign aluLogic_shiftL = (aluLogic_opA <<< aluLogic_opB[4 : 0]);
  assign aluLogic_shiftR = (aluLogic_opA >>> aluLogic_opB[4 : 0]);
  assign aluLogic_shiftRA = _zz_47;
  assign aluLogic_shiftLI = (aluLogic_opA <<< decodeLogic_shamt);
  assign aluLogic_shiftRI = (aluLogic_opA >>> decodeLogic_shamt);
  assign aluLogic_shiftRAI = _zz_49;
  always @ (*) begin
    aluLogic_output = 32'h0;
    case(decodeLogic_iType)
      `InstructionType_defaultEncoding_isRegReg : begin
        if((((decodeLogic_funct3 & 3'b111) == 3'b000)) || (((decodeLogic_funct3 & 3'b111) == 3'b000))) begin
            aluLogic_output = (((decodeLogic_funct7 & 7'h7f) == 7'h0) ? aluLogic_add : aluLogic_sub);
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b010))) begin
            aluLogic_output = ((aluLogic_lt_s == 1'b1) ? 32'h00000001 : 32'h0);
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b011))) begin
            aluLogic_output = ((aluLogic_lt_u == 1'b1) ? 32'h00000001 : 32'h0);
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b111))) begin
            aluLogic_output = aluLogic_bitAnd;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b110))) begin
            aluLogic_output = aluLogic_bitOr;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b100))) begin
            aluLogic_output = aluLogic_bitXor;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b001))) begin
            aluLogic_output = aluLogic_shiftL;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b101)) || (((decodeLogic_funct3 & 3'b111) == 3'b101))) begin
            aluLogic_output = (((decodeLogic_funct7 & 7'h7f) == 7'h0) ? aluLogic_shiftR : aluLogic_shiftRA);
        end
      end
      `InstructionType_defaultEncoding_isRegImm : begin
        if((((decodeLogic_funct3 & 3'b111) == 3'b000))) begin
            aluLogic_output = aluLogic_add;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b010))) begin
            aluLogic_output = ((aluLogic_lt_s == 1'b1) ? 32'h00000001 : 32'h0);
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b011))) begin
            aluLogic_output = ((aluLogic_lt_u == 1'b1) ? 32'h00000001 : 32'h0);
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b111))) begin
            aluLogic_output = aluLogic_bitAnd;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b110))) begin
            aluLogic_output = aluLogic_bitOr;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b100))) begin
            aluLogic_output = aluLogic_bitXor;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b001))) begin
            aluLogic_output = aluLogic_shiftLI;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b101)) || (((decodeLogic_funct3 & 3'b111) == 3'b101))) begin
            aluLogic_output = (((decodeLogic_funct7 & 7'h7f) == 7'h0) ? aluLogic_shiftRI : aluLogic_shiftRAI);
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    aluLogic_output_bool = 1'b0;
    case(decodeLogic_iType)
      `InstructionType_defaultEncoding_isBranch : begin
        if((((decodeLogic_funct3 & 3'b111) == 3'b000))) begin
            aluLogic_output_bool = aluLogic_equal;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b001))) begin
            aluLogic_output_bool = aluLogic_unequal;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b100))) begin
            aluLogic_output_bool = aluLogic_lt_s;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b101))) begin
            aluLogic_output_bool = aluLogic_ge_s;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b110))) begin
            aluLogic_output_bool = aluLogic_lt_u;
        end else if((((decodeLogic_funct3 & 3'b111) == 3'b111))) begin
            aluLogic_output_bool = aluLogic_ge_u;
        end
      end
      default : begin
      end
    endcase
  end

  assign cssrLogic_mvendorid = 32'h0;
  assign cssrLogic_marchid = 32'h0;
  assign cssrLogic_mimpid = 32'h0;
  assign cssrLogic_mhartid = 32'h0;
  assign _zz_75 = zz__zz_1(1'b0);
  always @ (*) _zz_1 = _zz_75;
  assign _zz_76 = zz__zz_2(1'b0);
  always @ (*) _zz_2 = _zz_76;
  assign cssrLogic_misa = _zz_2;
  assign cssrLogic_rdX0 = (decodeLogic_destination == 5'h0);
  assign cssrLogic_rs1X0 = (decodeLogic_source1 == 5'h0);
  assign cssrLogic_uimmZero = (decodeLogic_csr_uimm == 5'h0);
  assign cssrLogic_chooseOperand = (decodeLogic_iType == `InstructionType_defaultEncoding_isCSR);
  assign cssrLogic_wrCSRcnd = ((cssrLogic_rs1X0 && cssrLogic_chooseOperand) || (cssrLogic_uimmZero && (! cssrLogic_chooseOperand)));
  always @ (*) begin
    cssrLogic_isIllegalAccess = 1'b0;
    if(cssrLogic_ena)begin
      case(cssrLogic_addr)
        12'hf11 : begin
        end
        12'hf12 : begin
        end
        12'hf13 : begin
        end
        12'hf14 : begin
        end
        12'h300 : begin
        end
        12'h301 : begin
        end
        12'h302 : begin
        end
        12'h303 : begin
        end
        12'h304 : begin
        end
        12'h305 : begin
        end
        12'h341 : begin
        end
        12'h342 : begin
        end
        12'h343 : begin
        end
        12'h344 : begin
        end
        12'hb00 : begin
        end
        12'hb02 : begin
        end
        12'hb80 : begin
        end
        12'hb82 : begin
        end
        default : begin
          cssrLogic_isIllegalAccess = 1'b1;
        end
      endcase
    end
  end

  assign _zz_3 = 32'hffffffff;
  assign _zz_4 = 32'hffffffff;
  assign _zz_5 = 32'hffffffff;
  assign _zz_6 = 32'h00000888;
  assign _zz_7 = 32'hfffffffc;
  assign _zz_8 = (cssrLogic_wval & 32'hfffffffc);
  assign _zz_9 = 32'hffffffff;
  assign _zz_10 = (cssrLogic_wval & 32'hffffffff);
  assign _zz_11 = 32'hffffffff;
  assign _zz_12 = 32'hffffffff;
  assign controlFSM_wantExit = 1'b0;
  always @ (*) begin
    controlFSM_wantStart = 1'b0;
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
      end
      default : begin
        controlFSM_wantStart = 1'b1;
      end
    endcase
  end

  assign controlFSM_memWrite = 1'b0;
  assign controlFSM_haltCond = (io_halt || io_haltErr);
  assign controlFSM_timerIRQPending = ((cssrLogic_mip[7] && cssrLogic_mie[7]) && cssrLogic_mstatus[3]);
  assign controlFSM_memReady = io_sb_SBready;
  always @ (*) begin
    controlFSM_regWR = 1'b0;
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
        case(decodeLogic_iType)
          `InstructionType_defaultEncoding_isLUI, `InstructionType_defaultEncoding_isAUIPC, `InstructionType_defaultEncoding_isCT_JAL, `InstructionType_defaultEncoding_isCT_JALR, `InstructionType_defaultEncoding_isRegImm, `InstructionType_defaultEncoding_isRegReg : begin
            controlFSM_regWR = 1'b1;
          end
          `InstructionType_defaultEncoding_isBranch : begin
          end
          `InstructionType_defaultEncoding_isLoad : begin
          end
          `InstructionType_defaultEncoding_isStore : begin
          end
          `InstructionType_defaultEncoding_isIllegal, `InstructionType_defaultEncoding_isECall : begin
          end
          `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm : begin
          end
          `InstructionType_defaultEncoding_isTrapReturn : begin
          end
          `InstructionType_defaultEncoding_isFence : begin
          end
          default : begin
          end
        endcase
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
        case(decodeLogic_iType)
          `InstructionType_defaultEncoding_isLoad : begin
            controlFSM_regWR = 1'b1;
          end
          default : begin
          end
        endcase
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
        case(decodeLogic_iType)
          `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm : begin
            controlFSM_regWR = 1'b1;
          end
          default : begin
          end
        endcase
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    controlFSM_halted = 1'b0;
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
        controlFSM_halted = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    controlFSM_fetchSync = 1'b0;
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
        if(! controlFSM_timerIRQPending) begin
          controlFSM_fetchSync = 1'b1;
        end
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
      end
      default : begin
      end
    endcase
  end

  assign controlFSM_newFetch = 1'b0;
  always @ (*) begin
    io_sb_SBwrite = 1'b0;
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
        case(decodeLogic_iType)
          `InstructionType_defaultEncoding_isLUI, `InstructionType_defaultEncoding_isAUIPC, `InstructionType_defaultEncoding_isCT_JAL, `InstructionType_defaultEncoding_isCT_JALR, `InstructionType_defaultEncoding_isRegImm, `InstructionType_defaultEncoding_isRegReg : begin
          end
          `InstructionType_defaultEncoding_isBranch : begin
          end
          `InstructionType_defaultEncoding_isLoad : begin
          end
          `InstructionType_defaultEncoding_isStore : begin
            io_sb_SBwrite = 1'b1;
          end
          `InstructionType_defaultEncoding_isIllegal, `InstructionType_defaultEncoding_isECall : begin
          end
          `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm : begin
          end
          `InstructionType_defaultEncoding_isTrapReturn : begin
          end
          `InstructionType_defaultEncoding_isFence : begin
          end
          default : begin
          end
        endcase
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    pcLogic_pcEna = 1'b0;
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
        if(! controlFSM_timerIRQPending) begin
          if(controlFSM_memReady)begin
            pcLogic_pcEna = 1'b1;
          end
        end
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
        pcLogic_pcEna = 1'b0;
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    datapathLogic_src1 = 5'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(_zz_22)begin
          case(decodeLogic_iType)
            `InstructionType_defaultEncoding_isRegImm, `InstructionType_defaultEncoding_isLoad, `InstructionType_defaultEncoding_isCT_JALR, `InstructionType_defaultEncoding_isCSR : begin
              datapathLogic_src1 = decodeLogic_source1;
            end
            `InstructionType_defaultEncoding_isRegReg, `InstructionType_defaultEncoding_isBranch, `InstructionType_defaultEncoding_isStore : begin
              datapathLogic_src1 = decodeLogic_source1;
            end
            default : begin
            end
          endcase
        end
      end
    end
  end

  always @ (*) begin
    datapathLogic_src2 = 5'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(_zz_22)begin
          case(decodeLogic_iType)
            `InstructionType_defaultEncoding_isRegReg, `InstructionType_defaultEncoding_isBranch, `InstructionType_defaultEncoding_isStore : begin
              datapathLogic_src2 = decodeLogic_source2;
            end
            default : begin
            end
          endcase
        end
      end
    end
  end

  always @ (*) begin
    datapathLogic_dest = 5'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isLUI : begin
                datapathLogic_dest = decodeLogic_destination;
              end
              `InstructionType_defaultEncoding_isAUIPC : begin
                datapathLogic_dest = decodeLogic_destination;
              end
              `InstructionType_defaultEncoding_isCT_JAL : begin
                datapathLogic_dest = decodeLogic_destination;
              end
              `InstructionType_defaultEncoding_isCT_JALR : begin
                datapathLogic_dest = decodeLogic_destination;
              end
              `InstructionType_defaultEncoding_isRegImm : begin
                datapathLogic_dest = decodeLogic_destination;
              end
              `InstructionType_defaultEncoding_isRegReg : begin
                datapathLogic_dest = decodeLogic_destination;
              end
              `InstructionType_defaultEncoding_isECall, `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm, `InstructionType_defaultEncoding_isTrapReturn : begin
                if(! _zz_24) begin
                  if(! _zz_25) begin
                    if(_zz_26)begin
                      datapathLogic_dest = decodeLogic_destination;
                    end
                  end
                end
              end
              default : begin
              end
            endcase
          end else begin
            if(_zz_27)begin
              case(decodeLogic_iType)
                `InstructionType_defaultEncoding_isLoad : begin
                  datapathLogic_dest = decodeLogic_destination;
                end
                default : begin
                end
              endcase
            end else begin
              if(_zz_28)begin
                datapathLogic_dest = decodeLogic_destination;
              end
            end
          end
        end
      end
    end
  end

  always @ (*) begin
    datapathLogic_destData = 32'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isLUI : begin
                datapathLogic_destData = decodeLogic_immediate;
              end
              `InstructionType_defaultEncoding_isAUIPC : begin
                datapathLogic_destData = _zz_52;
              end
              `InstructionType_defaultEncoding_isCT_JAL : begin
                datapathLogic_destData = pcLogic_programCounter;
              end
              `InstructionType_defaultEncoding_isCT_JALR : begin
                datapathLogic_destData = pcLogic_programCounter;
              end
              `InstructionType_defaultEncoding_isRegImm : begin
                datapathLogic_destData = aluLogic_output;
              end
              `InstructionType_defaultEncoding_isRegReg : begin
                datapathLogic_destData = aluLogic_output;
              end
              `InstructionType_defaultEncoding_isECall, `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm, `InstructionType_defaultEncoding_isTrapReturn : begin
                if(! _zz_24) begin
                  if(! _zz_25) begin
                    if(_zz_26)begin
                      datapathLogic_destData = datapathLogic_csr_rval;
                    end
                  end
                end
              end
              default : begin
              end
            endcase
          end else begin
            if(_zz_27)begin
              case(decodeLogic_iType)
                `InstructionType_defaultEncoding_isLoad : begin
                  if((((decodeLogic_funct3 & 3'b111) == 3'b000))) begin
                      datapathLogic_destData = _zz_60;
                  end else if((((decodeLogic_funct3 & 3'b111) == 3'b001))) begin
                      datapathLogic_destData = _zz_62;
                  end else if((((decodeLogic_funct3 & 3'b111) == 3'b010))) begin
                      datapathLogic_destData = io_sb_SBrdata;
                  end else if((((decodeLogic_funct3 & 3'b111) == 3'b100))) begin
                      datapathLogic_destData = _zz_64;
                  end else if((((decodeLogic_funct3 & 3'b111) == 3'b101))) begin
                      datapathLogic_destData = _zz_66;
                  end
                end
                default : begin
                end
              endcase
            end else begin
              if(_zz_28)begin
                datapathLogic_destData = datapathLogic_csr_rval;
              end
            end
          end
        end
      end
    end
  end

  always @ (*) begin
    aluLogic_opA = 32'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isBranch : begin
                aluLogic_opA = datapathLogic_src1Data;
              end
              `InstructionType_defaultEncoding_isRegImm : begin
                aluLogic_opA = datapathLogic_src1Data;
              end
              `InstructionType_defaultEncoding_isRegReg : begin
                aluLogic_opA = datapathLogic_src1Data;
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  always @ (*) begin
    aluLogic_opB = 32'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isBranch : begin
                aluLogic_opB = datapathLogic_src2Data;
              end
              `InstructionType_defaultEncoding_isRegImm : begin
                aluLogic_opB = decodeLogic_immediate;
              end
              `InstructionType_defaultEncoding_isRegReg : begin
                aluLogic_opB = datapathLogic_src2Data;
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  always @ (*) begin
    io_sb_SBaddress = 32'h0;
    if(! _zz_20) begin
      if(_zz_21)begin
        io_sb_SBaddress = pcLogic_programCounter;
      end else begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isLoad : begin
                io_sb_SBaddress = (datapathLogic_src1Data + decodeLogic_immediate);
              end
              `InstructionType_defaultEncoding_isStore : begin
                io_sb_SBaddress = (datapathLogic_src1Data + decodeLogic_immediate);
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  always @ (*) begin
    io_sb_SBwdata = 32'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isStore : begin
                io_sb_SBwdata = datapathLogic_src2Data;
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  always @ (*) begin
    io_sb_SBsize = 4'b0100;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isLoad : begin
                if((((decodeLogic_funct3 & 3'b111) == 3'b000)) || (((decodeLogic_funct3 & 3'b111) == 3'b100))) begin
                    io_sb_SBsize = 4'b0001;
                end else if((((decodeLogic_funct3 & 3'b111) == 3'b001)) || (((decodeLogic_funct3 & 3'b111) == 3'b101))) begin
                    io_sb_SBsize = 4'b0010;
                end else if((((decodeLogic_funct3 & 3'b111) == 3'b010))) begin
                    io_sb_SBsize = 4'b0100;
                end
              end
              `InstructionType_defaultEncoding_isStore : begin
                if((((decodeLogic_funct3 & 3'b111) == 3'b000))) begin
                    io_sb_SBsize = 4'b0001;
                end else if((((decodeLogic_funct3 & 3'b111) == 3'b001))) begin
                    io_sb_SBsize = 4'b0010;
                end else if((((decodeLogic_funct3 & 3'b111) == 3'b010))) begin
                    io_sb_SBsize = 4'b0100;
                end
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  always @ (*) begin
    datapathLogic_csr_addr = 12'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isECall, `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm, `InstructionType_defaultEncoding_isTrapReturn : begin
                if(! _zz_24) begin
                  if(! _zz_25) begin
                    if(_zz_26)begin
                      datapathLogic_csr_addr = decodeLogic_csr;
                    end
                  end
                end
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  always @ (*) begin
    datapathLogic_csr_accType = `CSSRAccessType_defaultEncoding_CSRidle;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isECall, `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm, `InstructionType_defaultEncoding_isTrapReturn : begin
                if(! _zz_24) begin
                  if(! _zz_25) begin
                    if(_zz_26)begin
                      if((((decodeLogic_funct3 & 3'b111) == 3'b001)) || (((decodeLogic_funct3 & 3'b111) == 3'b101))) begin
                          datapathLogic_csr_accType = `CSSRAccessType_defaultEncoding_CSRwrite;
                      end else if((((decodeLogic_funct3 & 3'b111) == 3'b010)) || (((decodeLogic_funct3 & 3'b111) == 3'b110))) begin
                          datapathLogic_csr_accType = `CSSRAccessType_defaultEncoding_CSRset;
                      end else if((((decodeLogic_funct3 & 3'b111) == 3'b011)) || (((decodeLogic_funct3 & 3'b111) == 3'b111))) begin
                          datapathLogic_csr_accType = `CSSRAccessType_defaultEncoding_CSRclear;
                      end
                    end
                  end
                end
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  assign datapathLogic_csr_ena = 1'b0;
  always @ (*) begin
    datapathLogic_csr_wval = 32'h0;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isECall, `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm, `InstructionType_defaultEncoding_isTrapReturn : begin
                if(! _zz_24) begin
                  if(! _zz_25) begin
                    if(_zz_26)begin
                      datapathLogic_csr_wval = (decodeLogic_funct3[2] ? _zz_58 : datapathLogic_src1Data);
                    end
                  end
                end
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  assign cssrLogic_addr = datapathLogic_csr_addr;
  assign cssrLogic_accessType = datapathLogic_csr_accType;
  always @ (*) begin
    cssrLogic_ena = datapathLogic_csr_ena;
    if(! _zz_20) begin
      if(! _zz_21) begin
        if(! _zz_22) begin
          if(_zz_23)begin
            case(decodeLogic_iType)
              `InstructionType_defaultEncoding_isECall, `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm, `InstructionType_defaultEncoding_isTrapReturn : begin
                if(! _zz_24) begin
                  if(! _zz_25) begin
                    if(_zz_26)begin
                      cssrLogic_ena = 1'b1;
                    end
                  end
                end
              end
              default : begin
              end
            endcase
          end
        end
      end
    end
  end

  assign datapathLogic_csr_rval = cssrLogic_rval;
  assign cssrLogic_wval = datapathLogic_csr_wval;
  assign _zz_77 = zz__zz_13(1'b0);
  always @ (*) _zz_13 = _zz_77;
  assign _zz_78 = zz__zz_14(1'b0);
  always @ (*) _zz_14 = _zz_78;
  always @ (*) begin
    io_sb_SBvalid = controlFSM_memValid;
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
        case(decodeLogic_iType)
          `InstructionType_defaultEncoding_isLUI, `InstructionType_defaultEncoding_isAUIPC, `InstructionType_defaultEncoding_isCT_JAL, `InstructionType_defaultEncoding_isCT_JALR, `InstructionType_defaultEncoding_isRegImm, `InstructionType_defaultEncoding_isRegReg : begin
          end
          `InstructionType_defaultEncoding_isBranch : begin
          end
          `InstructionType_defaultEncoding_isLoad : begin
            io_sb_SBvalid = 1'b1;
          end
          `InstructionType_defaultEncoding_isStore : begin
            io_sb_SBvalid = 1'b1;
          end
          `InstructionType_defaultEncoding_isIllegal, `InstructionType_defaultEncoding_isECall : begin
          end
          `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm : begin
          end
          `InstructionType_defaultEncoding_isTrapReturn : begin
          end
          `InstructionType_defaultEncoding_isFence : begin
          end
          default : begin
          end
        endcase
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
      end
      default : begin
      end
    endcase
  end

  assign io_halted = controlFSM_halted;
  assign io_fetchSync = controlFSM_fetchSync;
  assign cssrLogic_newFetch = controlFSM_newFetch;
  always @ (*) begin
    io_dbgState = 3'b000;
    if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit))begin
      io_dbgState = 3'b000;
    end else begin
      if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch))begin
        io_dbgState = 3'b001;
      end else begin
        if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode))begin
          io_dbgState = 3'b010;
        end else begin
          if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute))begin
            io_dbgState = 3'b011;
          end else begin
            if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack))begin
              io_dbgState = 3'b100;
            end else begin
              if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR))begin
                io_dbgState = 3'b101;
              end else begin
                if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap))begin
                  io_dbgState = 3'b110;
                end else begin
                  if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt))begin
                    io_dbgState = 3'b111;
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  assign _zz_15 = (controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch);
  assign _zz_16 = (controlFSM_stateNext == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch);
  always @ (*) begin
    controlFSM_stateNext = controlFSM_stateReg;
    case(controlFSM_stateReg)
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
        controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
        if(controlFSM_timerIRQPending)begin
          controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt;
        end else begin
          if(controlFSM_memReady)begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode;
          end
        end
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
        if(decodeLogic_decoded)begin
          controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute;
        end else begin
          if(((! decodeLogic_decoded) && (decodeLogic_iType == `InstructionType_defaultEncoding_isIllegal)))begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt;
          end
        end
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
        case(decodeLogic_iType)
          `InstructionType_defaultEncoding_isLUI, `InstructionType_defaultEncoding_isAUIPC, `InstructionType_defaultEncoding_isCT_JAL, `InstructionType_defaultEncoding_isCT_JALR, `InstructionType_defaultEncoding_isRegImm, `InstructionType_defaultEncoding_isRegReg : begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
          end
          `InstructionType_defaultEncoding_isBranch : begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
          end
          `InstructionType_defaultEncoding_isLoad : begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack;
          end
          `InstructionType_defaultEncoding_isStore : begin
            if((((decodeLogic_funct3 & 3'b111) == 3'b000)) || (((decodeLogic_funct3 & 3'b111) == 3'b001)) || (((decodeLogic_funct3 & 3'b111) == 3'b010))) begin
                controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack;
            end else begin
                controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt;
            end
          end
          `InstructionType_defaultEncoding_isIllegal, `InstructionType_defaultEncoding_isECall : begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap;
          end
          `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm : begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR;
          end
          `InstructionType_defaultEncoding_isTrapReturn : begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
          end
          `InstructionType_defaultEncoding_isFence : begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
          end
          default : begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt;
          end
        endcase
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
        if((controlFSM_memReady && (! controlFSM_haltCond)))begin
          controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
        end else begin
          if(controlFSM_haltCond)begin
            controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt;
          end
        end
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
        controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
        controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
        controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch;
      end
      `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
      end
      default : begin
      end
    endcase
    if(controlFSM_wantStart)begin
      controlFSM_stateNext = `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit;
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      pcLogic_programCounter <= 32'h80000000;
      decodeLogic_instruction <= 32'h0;
      cssrLogic_rval <= 32'h0;
      cssrLogic_mstatus <= _zz_1;
      cssrLogic_medeleg <= 32'h0;
      cssrLogic_mideleg <= 32'h0;
      cssrLogic_mie <= 32'h0;
      cssrLogic_mtvec <= 32'h0;
      cssrLogic_mepc <= 32'h0;
      cssrLogic_mcause <= 32'h0;
      cssrLogic_mtval <= 32'h0;
      cssrLogic_mip <= 32'h0;
      cssrLogic_mtinst <= 32'h0;
      cssrLogic_minstret <= 64'h0;
      cssrLogic_mcycle <= 64'h0;
      controlFSM_memValid <= 1'b0;
      controlFSM_stateReg <= `controlFSM_enumDefinition_defaultEncoding_controlFSM_BOOT;
    end else begin
      if(pcLogic_pcEna)begin
        pcLogic_programCounter <= (pcLogic_programCounter + 32'h00000004);
      end
      cssrLogic_rval <= 32'h0;
      if(cssrLogic_ena)begin
        case(cssrLogic_addr)
          12'hf11 : begin
            cssrLogic_rval <= cssrLogic_mvendorid;
          end
          12'hf12 : begin
            cssrLogic_rval <= cssrLogic_marchid;
          end
          12'hf13 : begin
            cssrLogic_rval <= cssrLogic_mimpid;
          end
          12'hf14 : begin
            cssrLogic_rval <= cssrLogic_mhartid;
          end
          12'h300 : begin
            cssrLogic_rval <= (cssrLogic_mstatus & 32'h00001888);
            if((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRwrite))begin
              cssrLogic_mstatus <= (cssrLogic_wval & _zz_3);
            end else begin
              if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRset) && (decodeLogic_csr_uimm != 5'h0)))begin
                cssrLogic_mstatus <= ((cssrLogic_mstatus & (~ _zz_3)) | (cssrLogic_wval & _zz_3));
              end else begin
                if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRclear) && (decodeLogic_csr_uimm != 5'h0)))begin
                  cssrLogic_mstatus <= ((cssrLogic_mstatus & (~ _zz_3)) | ((~ cssrLogic_wval) & _zz_3));
                end
              end
            end
          end
          12'h301 : begin
            cssrLogic_rval <= cssrLogic_misa;
          end
          12'h302 : begin
            cssrLogic_rval <= cssrLogic_medeleg;
            if((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRwrite))begin
              cssrLogic_medeleg <= (cssrLogic_wval & _zz_4);
            end else begin
              if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRset) && (decodeLogic_csr_uimm != 5'h0)))begin
                cssrLogic_medeleg <= ((cssrLogic_medeleg & (~ _zz_4)) | (cssrLogic_wval & _zz_4));
              end else begin
                if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRclear) && (decodeLogic_csr_uimm != 5'h0)))begin
                  cssrLogic_medeleg <= ((cssrLogic_medeleg & (~ _zz_4)) | ((~ cssrLogic_wval) & _zz_4));
                end
              end
            end
          end
          12'h303 : begin
            cssrLogic_rval <= cssrLogic_mideleg;
            if((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRwrite))begin
              cssrLogic_mideleg <= (cssrLogic_wval & _zz_5);
            end else begin
              if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRset) && (decodeLogic_csr_uimm != 5'h0)))begin
                cssrLogic_mideleg <= ((cssrLogic_mideleg & (~ _zz_5)) | (cssrLogic_wval & _zz_5));
              end else begin
                if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRclear) && (decodeLogic_csr_uimm != 5'h0)))begin
                  cssrLogic_mideleg <= ((cssrLogic_mideleg & (~ _zz_5)) | ((~ cssrLogic_wval) & _zz_5));
                end
              end
            end
          end
          12'h304 : begin
            cssrLogic_rval <= (cssrLogic_mie & 32'h00000888);
            if((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRwrite))begin
              cssrLogic_mie <= (cssrLogic_wval & _zz_6);
            end else begin
              if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRset) && (decodeLogic_csr_uimm != 5'h0)))begin
                cssrLogic_mie <= ((cssrLogic_mie & (~ _zz_6)) | (cssrLogic_wval & _zz_6));
              end else begin
                if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRclear) && (decodeLogic_csr_uimm != 5'h0)))begin
                  cssrLogic_mie <= ((cssrLogic_mie & (~ _zz_6)) | ((~ cssrLogic_wval) & _zz_6));
                end
              end
            end
          end
          12'h305 : begin
            cssrLogic_rval <= cssrLogic_mtvec;
            if((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRwrite))begin
              cssrLogic_mtvec <= (_zz_8 & _zz_7);
            end else begin
              if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRset) && (decodeLogic_csr_uimm != 5'h0)))begin
                cssrLogic_mtvec <= ((cssrLogic_mtvec & (~ _zz_7)) | (_zz_8 & _zz_7));
              end else begin
                if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRclear) && (decodeLogic_csr_uimm != 5'h0)))begin
                  cssrLogic_mtvec <= ((cssrLogic_mtvec & (~ _zz_7)) | ((~ _zz_8) & _zz_7));
                end
              end
            end
          end
          12'h341 : begin
            cssrLogic_rval <= cssrLogic_mepc;
            if((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRwrite))begin
              cssrLogic_mepc <= (_zz_10 & _zz_9);
            end else begin
              if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRset) && (decodeLogic_csr_uimm != 5'h0)))begin
                cssrLogic_mepc <= ((cssrLogic_mepc & (~ _zz_9)) | (_zz_10 & _zz_9));
              end else begin
                if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRclear) && (decodeLogic_csr_uimm != 5'h0)))begin
                  cssrLogic_mepc <= ((cssrLogic_mepc & (~ _zz_9)) | ((~ _zz_10) & _zz_9));
                end
              end
            end
          end
          12'h342 : begin
            cssrLogic_rval <= cssrLogic_mcause;
            if((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRwrite))begin
              cssrLogic_mcause <= (cssrLogic_wval & _zz_11);
            end else begin
              if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRset) && (decodeLogic_csr_uimm != 5'h0)))begin
                cssrLogic_mcause <= ((cssrLogic_mcause & (~ _zz_11)) | (cssrLogic_wval & _zz_11));
              end else begin
                if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRclear) && (decodeLogic_csr_uimm != 5'h0)))begin
                  cssrLogic_mcause <= ((cssrLogic_mcause & (~ _zz_11)) | ((~ cssrLogic_wval) & _zz_11));
                end
              end
            end
          end
          12'h343 : begin
            cssrLogic_rval <= cssrLogic_mtval;
            if((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRwrite))begin
              cssrLogic_mtval <= (cssrLogic_wval & _zz_12);
            end else begin
              if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRset) && (decodeLogic_csr_uimm != 5'h0)))begin
                cssrLogic_mtval <= ((cssrLogic_mtval & (~ _zz_12)) | (cssrLogic_wval & _zz_12));
              end else begin
                if(((cssrLogic_accessType == `CSSRAccessType_defaultEncoding_CSRclear) && (decodeLogic_csr_uimm != 5'h0)))begin
                  cssrLogic_mtval <= ((cssrLogic_mtval & (~ _zz_12)) | ((~ cssrLogic_wval) & _zz_12));
                end
              end
            end
          end
          12'h344 : begin
            cssrLogic_rval <= cssrLogic_mip;
          end
          12'hb00 : begin
            cssrLogic_rval <= cssrLogic_mcycle[31 : 0];
          end
          12'hb02 : begin
            cssrLogic_rval <= cssrLogic_minstret[31 : 0];
          end
          12'hb80 : begin
            cssrLogic_rval <= cssrLogic_mcycle[63 : 32];
          end
          12'hb82 : begin
            cssrLogic_rval <= cssrLogic_minstret[63 : 32];
          end
          default : begin
            cssrLogic_rval <= 32'h0;
          end
        endcase
      end
      if(io_irqTimer)begin
        cssrLogic_mip[7] <= 1'b1;
      end else begin
        cssrLogic_mip[7] <= 1'b0;
      end
      cssrLogic_mcycle <= _zz_51;
      if(! _zz_20) begin
        if(_zz_21)begin
          decodeLogic_instruction <= io_sb_SBrdata;
        end else begin
          if(! _zz_22) begin
            if(_zz_23)begin
              case(decodeLogic_iType)
                `InstructionType_defaultEncoding_isCT_JAL : begin
                  pcLogic_programCounter <= (_zz_54 - 32'h00000004);
                end
                `InstructionType_defaultEncoding_isCT_JALR : begin
                  pcLogic_programCounter <= (_zz_55 & (~ 32'h00000001));
                end
                `InstructionType_defaultEncoding_isBranch : begin
                  if(aluLogic_output_bool)begin
                    pcLogic_programCounter <= (_zz_56 - 32'h00000004);
                  end
                end
                `InstructionType_defaultEncoding_isECall, `InstructionType_defaultEncoding_isCSR, `InstructionType_defaultEncoding_isCSRImm, `InstructionType_defaultEncoding_isTrapReturn : begin
                  if(_zz_24)begin
                    cssrLogic_mcause <= 32'h0000000b;
                    cssrLogic_mtval <= _zz_57;
                  end else begin
                    if(_zz_25)begin
                      cssrLogic_mstatus[3] <= cssrLogic_mstatus[7];
                      cssrLogic_mstatus[7] <= 1'b1;
                      pcLogic_programCounter <= cssrLogic_mepc;
                    end
                  end
                end
                `InstructionType_defaultEncoding_isIllegal : begin
                  cssrLogic_mtinst <= decodeLogic_instrSwapped;
                  cssrLogic_mcause <= 32'h00000002;
                end
                default : begin
                end
              endcase
            end else begin
              if(! _zz_27) begin
                if(! _zz_28) begin
                  if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap))begin
                    cssrLogic_mcause <= (cssrLogic_mcause & _zz_13);
                    cssrLogic_mtval <= _zz_67;
                    cssrLogic_mepc <= _zz_68;
                    pcLogic_programCounter <= _zz_69;
                  end else begin
                    if((controlFSM_stateReg == `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt))begin
                      if(controlFSM_timerIRQPending)begin
                        cssrLogic_mstatus[7] <= cssrLogic_mstatus[3];
                        cssrLogic_mstatus[3] <= 1'b0;
                        cssrLogic_mcause <= (_zz_14 | 32'h00000007);
                        cssrLogic_mtval <= _zz_71;
                        cssrLogic_mepc <= pcLogic_programCounter;
                        pcLogic_programCounter <= _zz_72;
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      controlFSM_stateReg <= controlFSM_stateNext;
      case(controlFSM_stateReg)
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInit : begin
        end
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateFetch : begin
          if(! controlFSM_timerIRQPending) begin
            controlFSM_memValid <= 1'b1;
          end
        end
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateDecode : begin
        end
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateExecute : begin
        end
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateWriteBack : begin
        end
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateTrap : begin
        end
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateCSR : begin
        end
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateInterrupt : begin
        end
        `controlFSM_enumDefinition_defaultEncoding_controlFSM_stateHalt : begin
        end
        default : begin
        end
      endcase
      if((_zz_15 && (! _zz_16)))begin
        controlFSM_memValid <= 1'b0;
        cssrLogic_minstret <= _zz_74;
      end
      if(((! _zz_15) && _zz_16))begin
        if(controlFSM_timerIRQPending)begin
          controlFSM_memValid <= 1'b0;
        end else begin
          controlFSM_memValid <= 1'b1;
        end
      end
    end
  end

  always @ (posedge clk) begin
    datapathLogic_src1Data <= regs_io_rs1Data;
    datapathLogic_src2Data <= regs_io_rs2Data;
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [4:0]    io_occupancy,
  output     [4:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [7:0]    _zz_3;
  wire       [0:0]    _zz_4;
  wire       [3:0]    _zz_5;
  wire       [0:0]    _zz_6;
  wire       [3:0]    _zz_7;
  wire       [3:0]    _zz_8;
  wire                _zz_9;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [3:0]    logic_pushPtr_valueNext;
  reg        [3:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [3:0]    logic_popPtr_valueNext;
  reg        [3:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_2;
  wire       [3:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:15];

  assign _zz_4 = logic_pushPtr_willIncrement;
  assign _zz_5 = {3'd0, _zz_4};
  assign _zz_6 = logic_popPtr_willIncrement;
  assign _zz_7 = {3'd0, _zz_6};
  assign _zz_8 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_9 = 1'b1;
  always @ (posedge clk) begin
    if(_zz_9) begin
      _zz_3 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(logic_pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 4'b1111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_5);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = 4'b0000;
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 4'b1111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_7);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = 4'b0000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2 && (! logic_full))));
  assign io_pop_payload = _zz_3;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_8};
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      logic_pushPtr_value <= 4'b0000;
      logic_popPtr_value <= 4'b0000;
      logic_risingOccupancy <= 1'b0;
      _zz_2 <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_2 <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_defaultEncoding_type io_config_frame_stop,
  input      `UartParityType_defaultEncoding_type io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               clk,
  input               reset
);
  wire                _zz_1;
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tick                ), //i
    .io_write_valid               (io_write_thrown_valid            ), //i
    .io_write_ready               (tx_io_write_ready                ), //o
    .io_write_payload             (io_write_thrown_payload[7:0]     ), //i
    .io_cts                       (_zz_1                            ), //i
    .io_txd                       (tx_io_txd                        ), //o
    .io_break                     (io_writeBreak                    ), //i
    .clk                          (clk                              ), //i
    .reset                        (reset                            )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tick                ), //i
    .io_read_valid                (rx_io_read_valid                 ), //o
    .io_read_ready                (io_read_ready                    ), //i
    .io_read_payload              (rx_io_read_payload[7:0]          ), //o
    .io_rxd                       (io_uart_rxd                      ), //i
    .io_rts                       (rx_io_rts                        ), //o
    .io_error                     (rx_io_error                      ), //o
    .io_break                     (rx_io_break                      ), //o
    .clk                          (clk                              ), //i
    .reset                        (reset                            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_defaultEncoding_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_defaultEncoding_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @ (*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break)begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break)begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign _zz_1 = 1'b0;
  assign io_readBreak = rx_io_break;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      clockDivider_counter <= 20'h0;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick)begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module RV32RegisterFile (
  input      [4:0]    io_rs1,
  input      [4:0]    io_rs2,
  output     [31:0]   io_rs1Data,
  output     [31:0]   io_rs2Data,
  input               io_wrEna,
  input      [4:0]    io_rd,
  input      [31:0]   io_rdData,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_2;
  wire       [31:0]   _zz_3;
  reg                 _zz_1;
  (* ram_style = "distributed" *) reg [31:0] regFile [0:31];

  initial begin
    $readmemb("MicroRV32Top.v_toplevel_cpu_regs_regFile.bin",regFile);
  end
  assign _zz_2 = regFile[io_rs1];
  assign _zz_3 = regFile[io_rs2];
  always @ (posedge clk) begin
    if(_zz_1) begin
      regFile[io_rd] <= io_rdData;
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(((io_rd != 5'h0) && io_wrEna))begin
      _zz_1 = 1'b1;
    end
  end

  assign io_rs1Data = _zz_2;
  assign io_rs2Data = _zz_3;

endmodule

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               clk,
  input               reset
);
  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire       [0:0]    _zz_6;
  wire       [2:0]    _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  reg                 _zz_1;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  reg        `UartCtrlRxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_2 = (stateMachine_parity == sampler_value);
  assign _zz_3 = (! sampler_value);
  assign _zz_4 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign _zz_5 = (bitCounter_value == io_configFrame_dataLength);
  assign _zz_6 = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? 1'b0 : 1'b1);
  assign _zz_7 = {2'd0, _zz_6};
  assign _zz_8 = ((((1'b0 || ((_zz_13 && sampler_samples_1) && sampler_samples_2)) || (((_zz_14 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_9 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_10 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_11 = (1'b1 && sampler_samples_1);
  assign _zz_12 = 1'b1;
  assign _zz_13 = (1'b1 && sampler_samples_0);
  assign _zz_14 = 1'b1;
  BufferCC io_rxd_buffercc (
    .io_dataIn     (io_rxd                      ), //i
    .io_dataOut    (io_rxd_buffercc_io_dataOut  ), //o
    .clk           (clk                         ), //i
    .reset         (reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlRxState_defaultEncoding_START : begin
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          if(! _zz_2) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick)begin
          if(_zz_3)begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_1;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @ (*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick)begin
      if((bitTimer_counter == 3'b000))begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign break_valid = (break_counter == 7'h68);
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign io_read_payload = stateMachine_shifter;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      _zz_1 <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_1 <= (! io_read_ready);
      if(io_samplingTick)begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick)begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick)begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick)begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_8 || _zz_9) || (_zz_10 && sampler_samples_4)) || ((_zz_11 && sampler_samples_2) && sampler_samples_4)) || (((_zz_12 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value)begin
        break_counter <= 7'h0;
      end else begin
        if((io_samplingTick && (! break_valid)))begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_defaultEncoding_IDLE : begin
          if(_zz_4)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_START;
          end
        end
        `UartCtrlRxState_defaultEncoding_START : begin
          if(bitTimer_tick)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_DATA;
            if((sampler_value == 1'b1))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_DATA : begin
          if(bitTimer_tick)begin
            if(_zz_5)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_PARITY : begin
          if(bitTimer_tick)begin
            if(_zz_2)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick)begin
            if(_zz_3)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end else begin
              if((bitCounter_value == _zz_7))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @ (posedge clk) begin
    if(sampler_tick)begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick)begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(_zz_4)begin
          bitTimer_counter <= 3'b010;
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick)begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick)begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(_zz_5)begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               clk,
  input               reset
);
  wire                _zz_2;
  wire       [0:0]    _zz_3;
  wire       [2:0]    _zz_4;
  wire       [0:0]    _zz_5;
  wire       [2:0]    _zz_6;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  reg                 _zz_1;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_2 = (tickCounter_value == io_configFrame_dataLength);
  assign _zz_3 = clockDivider_counter_willIncrement;
  assign _zz_4 = {2'd0, _zz_3};
  assign _zz_5 = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? 1'b0 : 1'b1);
  assign _zz_6 = {2'd0, _zz_5};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick)begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @ (*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_4);
    if(clockDivider_counter_willClear)begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @ (*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_2)begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign io_txd = _zz_1;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= `UartCtrlTxState_defaultEncoding_IDLE;
      _zz_1 <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_defaultEncoding_IDLE : begin
          if(((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow))begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_START;
          end
        end
        `UartCtrlTxState_defaultEncoding_START : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_DATA;
          end
        end
        `UartCtrlTxState_defaultEncoding_DATA : begin
          if(clockDivider_counter_willOverflow)begin
            if(_zz_2)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_defaultEncoding_PARITY : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow)begin
            if((tickCounter_value == _zz_6))begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_defaultEncoding_START : `UartCtrlTxState_defaultEncoding_IDLE);
            end
          end
        end
      endcase
      _zz_1 <= (stateMachine_txd && (! io_break));
    end
  end

  always @ (posedge clk) begin
    if(clockDivider_counter_willOverflow)begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow)begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_counter_willOverflow)begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_2)begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_counter_willOverflow)begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
