package br.com.zlx.invoicesapp.controller.banklaunch

import br.com.zlx.invoicesapp.model.BankLaunch
import br.com.zlx.invoicesapp.service.BankLaunchService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/bank-launch")
class BankLaunchController(
    val service: BankLaunchService
) {

    @PostMapping
    fun addLaunch(@RequestBody bankLaunch: BankLaunch): ResponseEntity<Any> {
        val result = this.service.save(bankLaunch)
        return ResponseEntity.ok(result)
    }
}