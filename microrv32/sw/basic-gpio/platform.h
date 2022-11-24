#ifndef PLATFORM_H
#define PLATFORM_H

// LED
static volatile uint32_t *LED_ADDR = (uint32_t *)0x81000000;
// CLIC
static volatile uint64_t *MTIMECMP_REG = (uint64_t *)0x02004000;
static volatile uint64_t *MTIME_REG = (uint64_t *)0x0200bff8;
// GPIO
static volatile uint32_t *GPIO_BANK_A_DIRECTION_ADDR = (uint32_t *)0x83000000;
static volatile uint32_t *GPIO_BANK_A_OUTPUT_ADDR = (uint32_t *)0x83000004;
static volatile uint32_t *GPIO_BANK_A_INPUT_ADDR = (uint32_t *)0x83000008;

typedef struct{
    volatile uint32_t TXDATA;
    volatile uint32_t TXCTRL;
    volatile uint32_t RXDATA;
    volatile uint32_t RXOCCU;
    volatile uint32_t RXALEM;
    volatile uint32_t RXEMPT;
} UART_REGS;

#define UART        ((UART_REGS *)0x82000000)


#endif /* PLATFORM_H */