package br.com.zlx.invoicesapp.model


import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Entity
import jakarta.persistence.Table
import jakarta.persistence.SequenceGenerator
import jakarta.persistence.Column
import jakarta.persistence.PrePersist
import lombok.Data
import lombok.NoArgsConstructor
import java.math.BigDecimal
import java.time.LocalDate
import java.time.LocalDateTime
import java.util.*

@Data
@NoArgsConstructor
@Entity
@Table(name = "bank_launch")
@SequenceGenerator(name = "bank_launch_seq_seq", sequenceName = "bank_launch_seq_seq", allocationSize = 1)
class BankLaunch {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "bank_launch_seq_seq")
    var id: Long? = 0
    var description: String = ""

    @Column(name = "buyer_id")
    val buyerId: String? = UUID.randomUUID().toString()
    lateinit var card: String
    lateinit var place: String
    lateinit var amount: BigDecimal

    @Column(name = "installment_value")
    lateinit var installmentValue: BigDecimal

    @Column(name = "number_of_installments")
    var numberOfInstallments: Int = 0

    @Column(name = "dte_purchase")
    lateinit var dtePurchase: LocalDate

    @Column(name = "due_date")
    lateinit var dueDate: LocalDate

    @Column(name = "dte_last_installment")
    lateinit var dteLastInstallment: LocalDate

    @Column(name = "launch_type")
    lateinit var launchType: String
    lateinit var status: String

    @Column(name = "number_of_installments_paid")
    var numberOfInstallmentsPaid: Int = 0

    @Column(name = "number_of_installments_remaining")
    var numberOfInstallmentsRemaining: Int = 0

    @Column(name = "remaining_total_amount")
    lateinit var remainingTotalAmount: BigDecimal

    @Column(name = "created_at")
    var createdAt: LocalDateTime? = null

    @Column(name = "updated_at")
    var updatedAt: LocalDateTime? = null


    @PrePersist
    fun initializeParams() {
        createdAt = LocalDateTime.now()
        updatedAt = LocalDateTime.now()
    }

}