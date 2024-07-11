#define LED_VERDE 2
#define LED_AMARELO 3
#define LED_VERMELHO 10
#define BOTAO 4
#define UM_SEGUNDO 1000
#define MEIO_SEGUNDO 500
#define TAMANHO_LISTA 3

int lista[TAMANHO_LISTA];
int contador = 1;

void setup() {
  Serial.begin(9600);
  pinMode(LED_VERMELHO, OUTPUT);
  pinMode(BOTAO, INPUT_PULLUP);
  digitalWrite(LED_VERMELHO, HIGH);
  delay(UM_SEGUNDO);
  digitalWrite(LED_VERMELHO, LOW);
}

void loop() {
  int estadoBotao = digitalRead(4);
  if (estadoBotao == 0) {
    piscaLed(LED_VERMELHO, UM_SEGUNDO, UM_SEGUNDO);
  }
}

void iniciarPortas() {
  pinMode(LED_VERDE, OUTPUT);
  pinMode(LED_AMARELO, OUTPUT);
  pinMode(LED_VERMELHO, OUTPUT);
}

void iniciarJogo() {
  lista[0] = LED_VERDE;
  lista[1] = LED_AMARELO;
  lista[2] = LED_VERMELHO;
}

void sequencia1() {
  piscaLed(
    LED_VERDE, UM_SEGUNDO, MEIO_SEGUNDO
  );

  piscaLed(
    LED_AMARELO, UM_SEGUNDO, MEIO_SEGUNDO
  );

  piscaLed(
    LED_VERMELHO, UM_SEGUNDO, MEIO_SEGUNDO
  );

}

void sequencia2() {
  digitalWrite(LED_VERDE, HIGH);
  digitalWrite(LED_AMARELO, HIGH);
  digitalWrite(LED_VERMELHO, HIGH);
  delay(UM_SEGUNDO);
  digitalWrite(LED_VERDE, LOW);
  digitalWrite(LED_AMARELO, LOW);
  digitalWrite(LED_VERMELHO, LOW);
  delay(UM_SEGUNDO);
}

void piscaLed(int portaLed, int tempoAcesso, int tempoApagado) {
  digitalWrite(portaLed, HIGH);
  delay(tempoAcesso);
  digitalWrite(portaLed, LOW);
  delay(tempoApagado);
}