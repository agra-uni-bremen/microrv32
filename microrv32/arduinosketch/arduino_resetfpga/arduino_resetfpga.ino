//macro for detection af rasing edge
#define RE(signal, state) (state=(state<<1)|(signal&1)&3)==1


bool cycleReset;
int coolDownRST;
int coolDownCLK;
int mode;
int rstVal;
int clkVal;
int fetchVal;

void setup() {
  // put your setup code here, to run once:
  pinMode(4, OUTPUT); //RST
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(8, OUTPUT); //CLK
  pinMode(A0, INPUT); //FETCH_CPU
  cycleReset = false;
  coolDownRST = 100; // ms
  coolDownCLK = 10; // ms
  rstVal = 0;
  clkVal = 0;
  fetchVal = 0;
  digitalWrite(LED_BUILTIN, LOW);
  digitalWrite(4, LOW);
  digitalWrite(8, LOW);
  Serial.begin(9600);
}

void loop() {
  mode = 0;
  while (Serial.available() > 0) {
    mode = Serial.parseInt();
    Serial.println(mode);
    if (Serial.read() == '\n') {
      switch (mode) {
        case 0:
          Serial.println("0: Short help");
          Serial.println("1: toggle reset on-off");
          Serial.println("2: toggle reset (newVal = !oldVal)");
          Serial.println("3: toggle clk for 10 cycles");
          Serial.println("4: toggle clock 1 cycle");
          Serial.println("5: clk+reset cycle + 100 cycles");
          Serial.println("50: clk+reset cycle");
          Serial.println("9: 1000 clock cycles");
          Serial.println("90: run for 90 cycles");
          break;
        case 1:
          Serial.println("Toggle reset at pin 4 for 100ms (low->high->low)");
          digitalWrite(LED_BUILTIN, HIGH);
          digitalWrite(4, HIGH);
          delay(coolDownRST);
          digitalWrite(LED_BUILTIN, LOW);
          digitalWrite(4, LOW);
          break;
        case 2:
          rstVal = !rstVal;
          Serial.print("Toggle reset at pin 4 (newVal = !oldVal)  newVal = ");
          Serial.println(rstVal);
          digitalWrite(LED_BUILTIN, rstVal);
          digitalWrite(4, rstVal);
          break;
        case 3:
          Serial.println("Toggle clk at pin 8 for 10 cycles (each being 100 ms)");
          for (int i = 0; i < 20; i++) {
            clkVal = !clkVal;
            digitalWrite(LED_BUILTIN, clkVal);
            digitalWrite(8, clkVal);
            delay(coolDownCLK);
          }
          digitalWrite(LED_BUILTIN, LOW);
          digitalWrite(8, LOW);
          break;
        case 4:
          clkVal = !clkVal;
          Serial.print("Toggle clk at pin 8 for one cycle : ");
          Serial.println(clkVal);
          digitalWrite(LED_BUILTIN, clkVal);
          digitalWrite(8, clkVal);
          clkVal = !clkVal;
          digitalWrite(LED_BUILTIN, clkVal);
          digitalWrite(8, clkVal);
          break;
        case 5:
          Serial.println("Startup sequence, CLK+RESET Sequence, CLK 100 cycles");
          clkVal = 0;
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          rstVal = 0;
          rstVal = !rstVal;
          digitalWrite(4, rstVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          rstVal = !rstVal;
          digitalWrite(4, rstVal);
          delay(coolDownCLK);
          for (int i = 0; i < 200; i++) {
            clkVal = !clkVal;
            digitalWrite(LED_BUILTIN, clkVal);
            digitalWrite(8, clkVal);
            delay(coolDownCLK);
          }
          break;
        case 9:
          Serial.println("Free running clock for 1000 cycles");
          for (int i = 0; i < 2000; i++) {
            clkVal = !clkVal;
            digitalWrite(LED_BUILTIN, clkVal);
            digitalWrite(8, clkVal);
            delay(coolDownCLK);
          }
          break;
        case 90:
          Serial.println("Run for 90 cylces");
          for (int i = 0; i < 46; i++) {
            clkVal = !clkVal;
            digitalWrite(LED_BUILTIN, clkVal);
            digitalWrite(8, clkVal);
            delay(coolDownCLK);
          }
          break;
        case 50:
          Serial.println("Reset cycle within a few clocks only");
          clkVal = 0;
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          rstVal = 0;
          rstVal = !rstVal;
          digitalWrite(4, rstVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          clkVal = !clkVal;
          digitalWrite(8, clkVal);
          delay(coolDownCLK);
          rstVal = !rstVal;
          digitalWrite(4, rstVal);
          delay(coolDownCLK);
          break;
        default: break;
      }
    }
  }
}
