package br.com.zlx.invoicesapp

import br.com.zlx.invoicesapp.model.BankLaunch
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface BankLaunchRepository: JpaRepository<BankLaunch, Long>{
}