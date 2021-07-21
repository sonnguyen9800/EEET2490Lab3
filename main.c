#include "uart.h"
void main()
{
 // set up serial console
 uart_init();

 // say hello
 uart_puts("Hello World!\n");
 // echo everything back
 while(1) {
 //read each char
 char c = uart_getc();
 //send back twice
 uart_puts("You typed:");
 if (c >= 97){
	 c -= 32;
 }
 uart_sendc(c);
 uart_puts("\n");

 }
}
