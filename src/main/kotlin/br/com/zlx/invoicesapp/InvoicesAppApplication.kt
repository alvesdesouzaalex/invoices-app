package br.com.zlx.invoicesapp

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class InvoicesAppApplication

fun main(args: Array<String>) {
	runApplication<InvoicesAppApplication>(*args)
}
