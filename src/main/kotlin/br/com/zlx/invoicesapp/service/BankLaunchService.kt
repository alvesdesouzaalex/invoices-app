package br.com.zlx.invoicesapp.service

import br.com.zlx.invoicesapp.BankLaunchRepository
import br.com.zlx.invoicesapp.model.BankLaunch
import jakarta.transaction.Transactional
import org.springframework.stereotype.Service

@Service
class BankLaunchService(
    val repository: BankLaunchRepository
) {

    @Transactional
    fun save(bankLaunch: BankLaunch): BankLaunch {
        val result = this.repository.save(bankLaunch)
        return result
    }
}